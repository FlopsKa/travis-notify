ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'rspec'
require 'rack/test'
require 'json'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end


