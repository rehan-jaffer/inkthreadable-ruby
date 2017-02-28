require 'pp'
require 'cgi'

# Inkthreadable API Request module
# Inkthreadable's API provides both JSON and XML access. For the sake of homogeneity, only one will be used here (JSON)

module Inkthreadable
  module API
    API_BASE_URL = 'http://api.inkthreadable.com/'.freeze

    class Error < StandardError
    end

    class Request
      def self.get(resource = 'orders.php', params: {})
        params['AppId'] = Inkthreadable::Setup.configuration.app_id
        query_string = sign_query_string(transform_params(params))
        begin
          data = URI("https://www.inkthreadable.co.uk/api/#{resource}?#{query_string}").read
          parsed_data = JSON.parse(data)
          if parsed_data.key?('error')
            raise Inkthreadable::API::Error, parsed_data['error']
          end
          return parsed_data
        rescue JSON::ParserError
          raise "Could not parse request JSON #{res.body}"
        end
      end

      private

      def self.transform_params(params)
        query_string = []
        params.each_pair do |k, v|
          query_string << "#{k}=#{CGI.escape(v)}"
        end
        query_string.join('&')
      end

      def self.sign_query_string(query_string)
        signature = Digest::SHA1.hexdigest(query_string + Inkthreadable::Setup.configuration.secret_key)
        query_string += "&Signature=#{signature}"
        query_string
      end
    end

    class Response
    end

    class RequestBuilder
      def self.build_params(_list)
      end
      end
  end
end
