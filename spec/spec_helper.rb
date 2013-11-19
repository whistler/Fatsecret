require 'simplecov'

SimpleCov.start do
  add_filter 'spec'
end

require 'fatsecret' # and any other gems you need
require 'rspec'
require 'webmock/rspec'

def a_get(method, endpoint='http://platform.fatsecret.com/rest/server.api')
  a_request(:get, endpoint).with(:query => hash_including({:method => method}))
end

def stub_get(method, endpoint='http://platform.fatsecret.com/rest/server.api')
  stub_request(:get, endpoint).with(:query => hash_including({:method => method}))
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
