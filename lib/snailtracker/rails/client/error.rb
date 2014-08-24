
module SnailTracker
  module Rails
    class Error < Client
      RESOURCE = "error"
      class << self
        def create(data)
          self.post(session_key, self::RESOURCE, data)
        end
      end
    end
  end
end