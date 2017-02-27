require "./lib/inkthreadable/version"
require "./lib/inkthreadable/order"

module Inkthreadable
  def self.configure
  end
  class Configuration
    attr_accessor :app_id
    attr_accessor :secret_key
  end
end
