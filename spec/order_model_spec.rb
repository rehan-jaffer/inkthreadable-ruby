require 'spec_helper'
require './lib/inkthreadable'

describe Inkthreadable::Order do

  describe Inkthreadable::Order::Order do

    it "can be instantiated" do
      expect { Inkthreadable::Order::Order.new }.not_to raise_error
    end

  end

end
