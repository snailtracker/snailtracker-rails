require 'httparty'
module SnailTracker
  module Rails
    class Client
      class << self
        attr_accessor :session_key
        def api_url
          SNAILTRACKER_API_URL
        end
        def api_key
          SNAILTRACKER_API_KEY
        end
        def pluralize(resource)
          ActiveSupport::Inflector.pluralize(resource)
        end
        def build_resource_url(resource)
          [api_url, "api", pluralize(resource)].join("/")
        end
        def build_request_data(session_key, resource, resource_data)
          { api_key: api_key, session_api_key: session_key, resource => resource_data }
        end
        def post(session_key, resource, resource_data)
          url = build_resource_url(resource)
          data = build_request_data(session_key, resource, resource_data)
          begin
            response = HTTParty.post(url, { body: data })
          rescue
          end
        end
      end
    end
  end
end
