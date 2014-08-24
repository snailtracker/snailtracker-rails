# Snailtracker::Rails (In Development)

The gem used to track bug information for SnailTracker in rails apps.

This is in development and should not yet be used on a production server.

## Installation

Add this line to your application's Gemfile:

    gem 'snailtracker-rails'

And then execute:

    $ bundle

## Usage

Setup your API keys and your SnailTracker server URL in ```config/initializers/snailtracker.rb```:
```
SNAILTRACKER_API_KEY = "api-key-generated-for-this-app-in-snailtracker"
SNAILTRACKER_API_URL = "http://your-snailtracker-server-url.com"
```
Then, add the following to ```config/application.rb``` after the "class Application < Rails::Application" line:
```
config.middleware.insert_after ActionDispatch::DebugExceptions, SnailTracker::Rails::Middleware
```

## License
AGPL
