require './lib/inkthreadable'
require 'spec_helper'

describe Inkthreadable::Order do

  describe "class methods" do

    describe "#create" do
      it "should be possible to create a new order" do
        props = valid_order_params
        Inkthreadable::Order.create(props)
      end
    end

    describe "#find" do

    end

    describe "#all" do

    end

    describe "#count" do
      it "should return the number of orders that exist" do
        expect(Inkthreadable::Order.count).to eq 0
      end
    end

  end

  describe "instance methods" do

    

  end  

end

def valid_order_params

  

end
