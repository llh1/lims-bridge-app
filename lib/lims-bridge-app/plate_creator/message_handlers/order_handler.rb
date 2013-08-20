require 'lims-bridge-app/plate_creator/base_handler'

module Lims::BridgeApp::PlateCreator
  module MessageHandler
    class OrderHandler < BaseHandler

      private

      # When an order message is received,
      # we check if it contains an item which is a stock plate 
      # with a done status. Otherwise, we just ignore the message
      # and delete the plates which could have been saved in sequencescape
      # but aren't stock plate.
      # We try to update the stock plate on Sequencescape, if the plate
      # is not found in Sequencescape, the message is requeued.
      # @param [AMQP::Header] metadata
      # @param [Hash] s2 resource 
      def _call_in_transaction
        order = s2_resource[:order]
        order_uuid = s2_resource[:uuid]
        date = s2_resource[:date]

        stock_plate_items = stock_plate_items(order)
        unless stock_plate_items.empty?
          success = true
          stock_plate_items.each do |items|
            items[:items].each do |item|
              if item.status == ITEM_DONE_STATUS
                begin
                  plate_uuid = item.uuid
                  plate_purpose_id = plate_purpose_id(items[:role])
                  update_plate_purpose_in_sequencescape(plate_uuid, date, plate_purpose_id)
                  bus.publish(plate_uuid)
                rescue PlateNotFoundInSequencescape, Sequel::Rollback => e
                  success = false
                  log.info("Error updating plate in Sequencescape: #{e}")
                else
                  success = success && true
                end
              end
            end
          end

          if success
            metadata.ack
            log.info("Order message processed and acknowledged")
          else
            metadata.reject(:requeue => true)
            raise Sequel::Rollback # Rollback the transaction
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
          STOCK_PLATES.each do |stock|
            order.each do |role, _|
              if role.match(stock)
                items << {:role => role, :items => order[role]}
              end
            end
          end
        end
      end

      # @param [String] role
      # @return [Integer]
      def plate_purpose_id(role)
        case role
        when STOCK_DNA_PLATE_ROLE then STOCK_PLATE_PURPOSE_ID 
        when STOCK_RNA_PLATE_ROLE then STOCK_RNA_PLATE_PURPOSE_ID 
        else UNASSIGNED_PLATE_PURPOSE_ID 
        end
      end
    end
  end
end
