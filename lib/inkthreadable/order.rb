require 'inkthreadable/order'
require 'inkthreadable/api'
require 'open-uri'
require 'json'
require 'digest/sha1'
require 'pp'

module Inkthreadable
  module Order

    class Order

      attr_accessor :id, :external_id, :created_at, :type, :status, :deleted, :brand, :billing_addresss, :xhipping_address
      attr_accessor :items, :summary, :shipping, :payment

      def initialize
      end

      
    end

    def self.count(since_id: nil, created_at_min: nil, created_at_max: nil, status: nil)
      response = Inkthreadable::API::Request.get('orders/count.php', {})
      response['count']
    end

    def self.all(ids: nil, limit: nil, page: nil, since_id: nil, created_at_min: nil, status: nil)
      response = Inkthreadable::API::Request.get('orders.php', {})
      response['orders']
    end

    def self.find(id:)
      puts Inkthreadable::API::Request.get('order.php', params: {"id": id})
      response['order']
    end

    # readable - created_at, type, status, deleted
    # writeable - brand, billing_address, shipping_address, items, external_id
    def self.create(_props)
    end
  end
end
