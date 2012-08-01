$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "project_monster/wiki/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "project_monster_wiki"
  s.version     = ProjectMonster::Wiki::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ProjectMonsterWiki."
  s.description = "TODO: Description of ProjectMonsterWiki."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"
  s.add_dependency 'twitter-bootstrap-rails'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.11.0"
end
