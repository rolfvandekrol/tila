$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tila/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tila"
  s.version     = Tila::VERSION
  s.authors     = ["Rolf van de Krol"]
  s.email       = ["info@rolfvandekrol.nl"]
  s.homepage    = "https://github.com/rolfvandekrol/tila"
  s.summary     = "Simple components for basic resource controller"
  s.description = "Provides a composition based approach to standard resource controllers"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "sqlite3"
end
