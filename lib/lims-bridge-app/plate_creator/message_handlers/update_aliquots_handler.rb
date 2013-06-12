require 'lims-bridge-app/plate_creator/base_handler'

module Lims::BridgeApp::PlateCreator
  module MessageHandler
    class UpdateAliquotsHandler < BaseHandler

      private

      # When a plate transfer message is received,
      # or an update message,
      # we update the target plate in sequencescape 
      # setting the transfered aliquots.
      # @param [AMQP::Header] metadata
      # @param [Hash] s2 resource
      def _call_in_transaction
        begin
          if s2_resource.has_key?(:plates)
            s2_resource[:plates].each do |plate|
              update_aliquots_in_sequencescape(plate[:plate], plate[:uuid], plate[:sample_uuids])
            end
          else
            update_aliquots_in_sequencescape(s2_resource[:plate], s2_resource[:uuid], s2_resource[:sample_uuids])
          end
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