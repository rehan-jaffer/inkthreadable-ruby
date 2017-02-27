# Inkthreadable API Request module
# Inkthreadable's API provides both JSON and XML access. For the sake of homogeneity, only one will be used here (JSON)

module Inkthreadable
  module API

  API_BASE_URL = "http://api.inkthreadable.com/"

  class Error < StandardError

  end

  class Request
    def initialize(app_id)
      @app_id = app_id or raise Exception, "No App ID provided, requests will fail"
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
