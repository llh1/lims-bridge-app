require 'lims-bridge-app/plate_creator/base_handler'

module Lims::BridgeApp::PlateCreator
  module MessageHandler
    class PlateHandler < BaseHandler

      private

      # When a plate creation message is received, 
      # the plate is created in Sequencescape database.
      # If everything goes right, the message is acknowledged.
      # @param [AMQP::Header] metadata
      # @param [Hash] s2 resource 
      # @example
      # {:plate => Lims::Core::Laboratory::Plate, :uuid => xxxx}
      def _call_in_transaction
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
    end
  end
end
