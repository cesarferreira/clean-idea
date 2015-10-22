# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clean-idea/version'

Gem::Specification.new do |spec|
  spec.name          = "clean-idea"
  spec.version       = Clean::Idea::VERSION
  spec.authors       = ["cesarferreira"]
  spec.email         = ["cesar.manuel.ferreira@gmail.com"]

  spec.summary       = %q{Clean up the intellij Android studio files }
  spec.description   = %q{Clean up the intellij Android studio files }
  spec.homepage      = "https://github.com/cesarferreira/clean-idea"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'pry-byebug', '~> 3.2'
  spec.add_development_dependency "rspec"

  spec.add_dependency 'colorize',  '~> 0.7'
end
