# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'plinko/version'

Gem::Specification.new do |spec|
  spec.name          = 'plinko'
  spec.version       = Plinko::VERSION
  spec.authors       = ['Mitch Monsen', 'Benjamin Kimball', 'Nathan Davis']
  spec.email         = ['mitch@creditera.com', 'ben@creditera.com', 'ndavis@creditera.com']
  spec.summary       = 'Composable, collected validations.'
  spec.description   = 'Plinko helps you create validators that collect all validation errors instead of breaking on the first failure.'
  spec.homepage      = 'https://github.com/creditera/plinko'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split('\x0').reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
end