require 'lims-busclient'
require 'lims-bridge-app/plate_creator/json_decoder'
require 'lims-bridge-app/plate_creator/sequencescape_updater'
require 'lims-bridge-app/s2_resource'

module Lims::BridgeApp
  module PlateCreator
    # When a stock plate is created on S2, it must be created in
    # Sequencescape as well. To identify a stock plate creation in S2,
    # two kinds of message need to be recorded on the message bus:
    # plate creation messages and order creation/update messages.
    # Plate creation messages contain the structure of the plate, whereas 
    # order messages identify the type of the plate in its items. 
    # Every time a plate creation message is received, a new plate is 
    # created in Sequencescape side with a plate purpose set to Unassigned.
    # As soon as we receive an order message which references a plate which 
    # has been created in SS, its plate purpose is updated to Stock Plate.
    # If a stock plate appears in an order message but cannot be found in 
    # Sequencescape database, it means the order message has been received 
    # before the plate creation message. The order message is then requeued 
    # waiting for the plate message to arrive.
    # Note: S2 tuberacks are treated like plates in Sequencescape.
    class StockPlateConsumer
      include Lims::BusClient::Consumer
      include JsonDecoder
      include SequencescapeUpdater
      include S2Resource

      attribute :queue_name, String, :required => true, :writer => :private, :reader => :private
      attribute :log, Object, :required => false, :writer => :private
      attribute :routing_keys, Array, :required => false, :writer => :private

      EXPECTED_ROUTING_KEYS_PATTERNS = [
        '*.*.plate.create',
        '*.*.tuberack.create',
        '*.*.order.create',
        '*.*.order.updateorder',
        '*.*.platetransfer.platetransfer'
      ].map { |k| Regexp.new(k.gsub(/\./, "\\.").gsub(/\*/, ".*")) }

      # Initilize the SequencescapePlateCreator class
      # @param [String] queue name
      # @param [Hash] AMQP settings
      def initialize(amqp_settings, mysql_settings)
        @queue_name = amqp_settings.delete("queue_name") 
        @routing_keys = amqp_settings.delete("routing_keys")
        consumer_setup(amqp_settings)
        sequencescape_db_setup(mysql_settings)
        set_queue
      end

      # @param [Logger] logger
      def set_logger(logger)
        @log = logger
      end

      private

      def expected_message?(routing_key)
        EXPECTED_ROUTING_KEYS_PATTERNS.each do |pattern|
          return true if routing_key.match(pattern)
        end
        false
      end

      # Setup the queue.
      # 3 different behaviours depending on the routing key
      # of the message (plate/plate_transfer/order). 
      def set_queue
        self.add_queue(queue_name, routing_keys) do |metadata, payload|
          log.info("Message received with the routing key: #{metadata.routing_key}")
          if expected_message?(metadata.routing_key)
            log.debug("Processing message with routing key: '#{metadata.routing_key}' and payload: #{payload}")
            s2_resource = s2_resource(payload)

            # On reception of a plate creation message
            # Plate and tuberack are stored in the same place in sequencescape
            if metadata.routing_key =~ /plate|tuberack\.create/
              plate_message_handler(metadata, s2_resource)       
              # On reception of an order creation/update message
            elsif metadata.routing_key =~ /order\.create|updateorder/
              order_message_handler(metadata, s2_resource)
              # On reception of a plate transfer message
            elsif metadata.routing_key =~ /platetransfer/
              platetransfer_message_handler(metadata, s2_resource)
            end
          else
            metadata.reject
            log.debug("Message rejected: plate creator not interested with the message (routing key: #{metadata.routing_key})")
          end
        end
      end

      # When a plate creation message is received, 
      # the plate is created in Sequencescape database.
      # If everything goes right, the message is acknowledged.
      # @param [AMQP::Header] metadata
      # @param [Hash] s2 resource 
      # @example
      # {:plate => Lims::Core::Laboratory::Plate, :uuid => xxxx}
      def plate_message_handler(metadata, s2_resource)
        begin 
          create_plate_in_sequencescape(s2_resource[:plate], 
                                        s2_resource[:uuid], 
                                        s2_resource[:sample_uuids])
        rescue Sequel::Rollback => e
          metadata.reject(:requeue => true)
          log.error("Error saving plate in Sequencescape: #{e}")
        else
          metadata.ack
          log.info("Plate message processed and acknowledged")
        end
      end

      # When an order message is received,
      # we check if it contains an item which is a stock plate 
      # with a done status. Otherwise, we just ignore the message
      # and delete the plates which could have been saved in sequencescape
      # but aren't stock plate.
      # We try to update the stock plate on Sequencescape, if the plate
      # is not found in Sequencescape, the message is requeued.
      # @param [AMQP::Header] metadata
      # @param [Hash] s2 resource 
      def order_message_handler(metadata, s2_resource)
        order = s2_resource[:order]
        order_uuid = s2_resource[:uuid]

        stock_plate_items = stock_plate_items(order)
        other_items = order.keys.delete_if {|k| STOCK_PLATES.include?(k)}.map {|k| order[k]}
        delete_unassigned_plates_in_sequencescape(other_items)

        unless stock_plate_items.empty?
          success = true
          stock_plate_items.flatten.each do |item|
            if item.status == ITEM_DONE_STATUS
              begin
                update_plate_purpose_in_sequencescape(item.uuid)
              rescue PlateNotFoundInSequencescape => e
                success = false
                log.error("Plate not found in Sequencescape: #{e}")
              rescue Sequel::Rollback => e
                success = false
                log.error("Error updating plate in Sequencescape: #{e}")
              else
                success = success && true
              end
            end
          end
          if success
            metadata.ack
            log.info("Order message processed and acknowledged")
          else
            metadata.reject(:requeue => true)
          end
        else
          metadata.ack
          log.info("Order message processed and acknowledged")
        end
      end

      # Get all the stock plate items from an order
      # @param [Lims::Core::Organization::Order] order
      # @return [Array] stock plate items
      def stock_plate_items(order)
        [].tap do |items|
          STOCK_PLATES.each do |role|
            items << order[role] if order[role]
          end
        end
      end

      # When a plate transfer message is received,
      # we update the target plate in sequencescape 
      # setting the transfered aliquots.
      # @param [AMQP::Header] metadata
      # @param [Hash] s2 resource
      def platetransfer_message_handler(metadata, s2_resource)
        begin
          update_aliquots_in_sequencescape(s2_resource[:plate], 
                                           s2_resource[:uuid], 
                                           s2_resource[:sample_uuids])
        rescue Sequel::Rollback => e
          metadata.reject(:requeue => true)
          log.error("Error updating plate aliquots in Sequencescape: #{e}")
        else
          metadata.ack
          log.info("Plate transfer message processed and acknowledged")
        end
      end
    end
  end
end
