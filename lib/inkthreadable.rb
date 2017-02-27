require "./lib/inkthreadable/version"
require "./lib/inkthreadable/order"

module Inkthreadable

  class Setup

    class << self
      attr_accessor :configuration
    end


    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure
      yield(configuration)
    end

    class Configuration

      attr_accessor :app_id
      attr_accessor :secret_key

      def initialize
        @app_id = "APP-00100205"
        @secret_key = ENV['SECRET_KEY']
      end
    end

  end

end
