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
      it 'should urlencode requests to avoid scrambling URLs' do
        VCR.use_cassette('order_sql_inject') do
          expect { Inkthreadable::Order.find(id: "';") }.to raise_error Inkthreadable::API::Error
        end
      end
      it "should not return an order where there isn't one" do
        VCR.use_cassette('order_not_found') do
          expect { Inkthreadable::Order.find(id: 6_667_784_080) }.to raise_error Inkthreadable::API::Error
        end
      end
    end

    describe '#all' do
      it 'should return all the orders' do
        VCR.use_cassette('order_all') do
          expect(Inkthreadable::Order.all(page: 1)).to eq []
        end
      end
    end

    describe '#count' do
      it 'should return the number of orders that exist' do
        VCR.use_cassette('order_count') do
          expect(Inkthreadable::Order.count).to eq 0
        end
      end
    end
  end

  describe 'instance methods' do
  end
end

def valid_order_params; end
