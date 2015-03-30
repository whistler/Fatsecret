Gem::Specification.new do |s|
  s.name        = 'fatsecret-api'
  s.version     = '0.1.4'
  s.date        = '2012-02-19'
  s.summary     = 'A Ruby Wrapper to the FatSecret API'
  s.description = 'Connects to FatSecret API and retrieves nutritional data'
  s.authors     = ['Ibrahim Muhammad', 'Bobby Uhlenbrock']
  s.email       = 'ibrahim.mohammad@gmail.com'
  s.files       = ['lib/fatsecret.rb']
  s.homepage    = 'http://www.github.com/whistler/fatsecret'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'simplecov'
end
