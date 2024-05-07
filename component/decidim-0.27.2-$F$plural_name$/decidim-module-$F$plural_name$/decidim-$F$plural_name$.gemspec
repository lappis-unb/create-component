# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "decidim/$plural_name$/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.version = Decidim::$Plural_name$.version
  s.authors = ["Giovanni Giampauli"]
  s.email = ["giovanni.acg@gmail.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://gitlab.com/lappis-unb/decidimbr/components-brasil-participativo/create-component"
  s.required_ruby_version = ">= 3.0"

  s.name = "decidim-$plural_name$"
  s.summary = "Decidim $plural_name$ module"
  s.description = "A $plural_name$ component for decidim's participatory processes."

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::$Plural_name$.version

  s.add_development_dependency "decidim-dev", Decidim::$Plural_name$.version
  s.add_development_dependency "decidim-participatory_processes", Decidim::$Plural_name$.version
end
