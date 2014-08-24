# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snailtracker/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "snailtracker-rails"
  spec.version       = Snailtracker::Rails::VERSION
  spec.authors       = ["Michael Patterson"]
  spec.email         = ["mppatterson15@gmail.com"]
  spec.summary       = %q{Track errors for SnailTracker in your rails app.}
  spec.description   = %q{Track errors for SnailTracker in your rails app.}
  spec.homepage      = "http://snailtracker.com"
  spec.license       = "AGPL"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
