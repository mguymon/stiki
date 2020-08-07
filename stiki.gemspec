$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stiki/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stiki"
  s.version     = Stiki::VERSION
  s.authors     = ["Michael Guymon"]
  s.email       = ["michael.guymon@gmail.com"]
  s.homepage    = "https://github.com/mguymon/stiki"
  s.summary     = "The Icky Stiki Wiki"
  s.description = "A simple wiki Rails engine"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["{test,spec}/**/*"]

  s.add_dependency "rails", "~> 3.2.1"
  s.add_dependency "friendly_id", "~> 4.0.1"
  s.add_dependency 'kramdown', ">= 0.14", "< 2.4"

  s.add_development_dependency "devise", "~> 2.0.1"
  s.add_development_dependency "cancan", "~> 1.6.1"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.11.0"
  s.add_development_dependency 'factory_girl_rails', "~> 3.6.0"
  s.add_development_dependency 'shoulda-matchers', '~> 1.2.0'
end
