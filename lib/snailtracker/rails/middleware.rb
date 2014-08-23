module SnailTracker
  module Rails
    class Middleware
      def initialize(app)
        @app = app
      end
      def call(env)
        begin
          @app.call(env)
        rescue => exception
          puts "SnailTracker caught exception: #{exception}"
          raise
        end
      end
    end
  end
end
