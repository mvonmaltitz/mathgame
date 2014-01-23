# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mathgame/version'

Gem::Specification.new do |spec|
  spec.name          = "mathgame"
  spec.version       = Mathgame::VERSION
  spec.authors       = ["MvM"]
  spec.email         = [""]
  spec.description   = %q{A simple game to practice arithmetical skills}
  spec.summary       = %q{A executable math game}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ["mathgame"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
