require './lib/inkthreadable'
require 'spec_helper'

describe Inkthreadable::Order do
  describe 'class methods' do
    describe '#create' do
      it 'should be possible to create a new order' do
        props = valid_order_params
        Inkthreadable::Order.create(props)
      end
    end

    describe '#find' do
      it "should urlencode requests to avoid scrambling URLs" do
        expect { Inkthreadable::Order.find("';") }.to raise_error Inkthreadable::API::Error
      end
    end

    describe '#all' do
      it "should return all the orders" do
        expect(Inkthreadable::Order.all(page: 1)).to eq []
      end
    end

    describe '#count' do
      it 'should return the number of orders that exist' do
        expect(Inkthreadable::Order.count).to eq 0
      end
    end
  end

  describe 'instance methods' do
  end
end

def valid_order_params; end
