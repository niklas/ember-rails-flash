$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ember-rails-flash/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ember-rails-flash"
  s.version     = EmberRailsFlash::VERSION
  s.authors     = ["Niklas Hofer"]
  s.email       = ["niklas+dev@lanpartei.de"]
  s.homepage    = "http://niklas.github.com"
  s.summary     = "Rails' flash messages for Ember.js"
  s.description = "Uses HTTP headers to transport Rails' flash messages to an Ember.View"

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["GPL-3", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency "rails", ">= 3.0"
  s.add_dependency "coffee-script"
  s.add_dependency "htmlentities"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rspec"
end
