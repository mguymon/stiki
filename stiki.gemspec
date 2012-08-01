$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stiki/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stiki"
  s.version     = Stiki::VERSION
  s.authors     = ["Michael Guymon"]
  s.email       = ["michael.guymon@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "The Icky Stiki Wiki"
  s.description = "TODO: Description of Stiki."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"
  s.add_dependency "friendly_id", "~> 4.0.1"
  s.add_dependency 'twitter-bootstrap-rails'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.11.0"
end
