require 'airbrake'
require 'delayed/performable_method'
require 'delayed/plugin'

require 'delayed-plugins-airbrake/version'

module Delayed::Plugins::Airbrake
  class Plugin < ::Delayed::Plugin
    module Notify
      def error(job, error)
        ::Airbrake.notify_or_ignore(
          :error_class   => error.class.name,
          :error_message => "#{error.class.name}: #{error.message}",
          :backtrace     => error.backtrace,
          :parameters    => {
            :failed_job => job.inspect,
          }
        )
        super if defined?(super)
      end
    end

    callbacks do |lifecycle|
      lifecycle.before(:invoke_job) do |job|
        payload = job.payload_object
        payload = payload.object if payload.is_a? Delayed::PerformableMethod
        payload.extend Notify
      end
    end
  end

  # This can be used to test that the plugin is working
  class Bomb
    def self.blow_up
      raise 'Test from Delayed::Plugins::Airbrake::Bomb'
    end
  end
end
