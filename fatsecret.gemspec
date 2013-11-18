Gem::Specification.new do |s|
  s.name        = 'fatsecret-api'
  s.version     = '0.1.0'
  s.date        = '2012-02-19'
  s.summary     = "Connects to FatSecret API and retrieves nutritional data"
  s.description = "Connects to FatSecret API and retrieves nutritional data"
  s.authors     = ["Ibrahim Muhammad", "Bobby Uhlenbrock"]
  s.email       = 'ibrahim.mohammad@gmail.com'
  s.files       = ["lib/fatsecret.rb"]
  s.homepage    = 'http://www.github.com/whistler/fatsecret'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
end
