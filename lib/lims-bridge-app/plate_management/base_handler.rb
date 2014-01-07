require 'lims-bridge-app/plate_management/sequencescape_updater'
require 'lims-bridge-app/message_bus'
require 'common'
require 'sequel/adapters/mysql2'
require 'amqp'

module Lims::BridgeApp::PlateManagement
  module MessageHandler
    class BaseHandler
      include SequencescapeUpdater

      # Fix for a bug in Aequitas which doesn't support
      # correctly class inheritance.
      def self.inherited(klass)
        klass.class_eval do
          include Virtus
          include Aequitas
          attribute :db, Sequel::Mysql2::Database, :required => true, :writer => :private, :reader => :private
          attribute :metadata, ::AMQP::Header, :required => true, :writer => :private, :reader => :private
          attribute :s2_resource, Hash, :required => true, :writer => :private, :reader => :private
          attribute :log, Object, :required => true, :writer => :private, :reader => :private 
          attribute :bus, Lims::BridgeApp::MessageBus, :required => true, :writer => :private
          attribute :settings, Hash, :required => true, :writer => :private

          # @param [Sequel::MySQL::Database] db
          # @param [Lims::Core::Persistence::MessageBus] bus
          # @param [Object] log
          # @param [AMQP::Header] metadata
          # @param [Hash] s2_resource
          # @param [Hash] settings
          def initialize(db, bus, log, metadata, s2_resource, settings)
            @db = db
            @bus = bus
            @log = log
            @metadata = metadata
            @s2_resource = s2_resource
            @settings = settings
          end
        end
      end

      def _call_in_transaction
        raise NoMethodError
      end
    end
  end
end
