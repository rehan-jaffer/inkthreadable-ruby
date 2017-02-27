require 'inkthreadable/order'
require 'inkthreadable/api'
require 'open-uri'
require 'json'
require 'digest/sha1'

module Inkthreadable
  class Order

    def self.count
    
    end

    def self.all
    end

    def self.find
    end


    # this all needs to get moved into API module asap, coding this during a spike
    def self.get_json(resource, params)

        params ||= []
        query_string = []
        params["AppId"] = Inkthreadable::Setup.configuration.app_id
        params.each_pair do |k,v|
          query_string << "#{k}=#{v}"
        end
        query_string = query_string.join("&")
        signature = Digest::SHA1.hexdigest(query_string + Inkthreadable::Setup.configuration.secret_key)
        query_string += "&Signature=#{signature}"
        
        data = URI("https://www.inkthreadable.co.uk/api/orders.php?#{query_string}").read
        begin
          parsed_data = JSON.parse(data)
          if parsed_data.has_key?("error")
            raise Inkthreadable::API::Error, parsed_data["error"]
          end
          parsed_data
        rescue JSON::ParserError
          fail "Could not parse request JSON #{res.body}"
        end

      end

  end
end 
