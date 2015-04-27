require './lib/plinko/version'

Gem::Specification.new do |spec|
  spec.name          = 'plinko'
  spec.version       = Plinko::VERSION
  spec.authors       = ['Mitch Monsen', 'Benjamin Kimball', 'Nathan Davis']
  spec.email         = ['mmonsen7@gmail.com', 'ben@creditera.com', 'nbriardavis@gmail.com']
  spec.summary       = 'Composable, collected validations.'
  spec.description   = 'Plinko helps you create validators that collect all validation errors instead of breaking on the first failure.'
  spec.homepage      = 'https://github.com/creditera/plinko'
  spec.license       = 'MIT'
  spec.files         = %w(./lib/plinko.rb ./lib/plinko/version.rb ./lib/plinko/multi_validator.rb ./lib/plinko/validation.rb ./lib/plinko/validator.rb)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
end