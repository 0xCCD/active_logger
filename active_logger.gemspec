$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_logger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_logger"
  s.version     = ActiveLogger::VERSION
  s.authors     = ["Christian Lallemand"]
  s.email       = ["ccdesignz@googlemail.com"]
  s.homepage    = "https://github.com/0xCCD"
  s.summary     = "ActiveLogger adds the ability to auto save all changes to the database"
  s.description = "ActiveLogger adds the ability to auto save all changes to the database"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"

  s.add_development_dependency "sqlite3"
end
