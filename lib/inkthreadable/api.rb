require 'pp'

# Inkthreadable API Request module
# Inkthreadable's API provides both JSON and XML access. For the sake of homogeneity, only one will be used here (JSON)

module Inkthreadable
  module API

  API_BASE_URL = "http://api.inkthreadable.com/"

  class Error < StandardError

  end

  class Request

    def self.get(resource, params)

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
        pp data
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

    # get a resource
    # params
    # resource - a valid inkthreadable resource
    # params - a set of params built by RequestBuilder
    def get(resource, params)

    end
  end

  class Response
  end    

  class RequestBuilder
    def self.build_params(list)
    end
    end
  end
end
