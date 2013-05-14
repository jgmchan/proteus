# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proteus/version'

Gem::Specification.new do |gem|
  gem.name          = "proteus"
  gem.version       = Proteus::VERSION
  gem.authors       = ["jgmchan"]
  gem.email         = ["jgmchan@gmail.com"]
  gem.description   = %q{Proteus is a simple tool to manage your multiple git configurations}
  gem.summary       = %q{Proteus - Manage your git configs}
  gem.homepage      = "https://github.com/jgmchan/proteus"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("grit")
  gem.add_dependency("gitable")
  gem.add_dependency("thor")

  gem.add_development_dependency('rspec')
  gem.add_development_dependency('guard-rspec')
end
