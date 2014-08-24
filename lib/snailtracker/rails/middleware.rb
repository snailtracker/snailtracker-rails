module SnailTracker
  module Rails
    class Middleware
      attr_accessor :app, :session_key
      def initialize(app)
        @app = app
      end
      def get_session_key(env)
        request = ActionDispatch::Request.new(env)
        request.cookies["snailtracker-session"]
      end
      def call(env)
        session_key = get_session_key(env)
        # If no session key is set, we can't track the data,
        # so just leave.
        unless session_key
          return @app.call(env)
        end

        begin
          @app.call(env)
        rescue => exception
          begin
            SnailTracker::Rails::Error.session_key = session_key
            SnailTracker::Rails::Error.create({exception_class: exception.class.to_s, message: exception.message})
          rescue
          end
          puts "SnailTracker caught exception: #{exception}"
          raise
        end
      end
    end
  end
end
