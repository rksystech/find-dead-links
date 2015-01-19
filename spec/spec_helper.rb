$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'rspec'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'semantic_logger'

RSpec.configure do |config|
	config.before(:each) do
  	@valid_url = 'https://google.com/'
  	@invalid_url = 'https://gosdfdsfdsogle.com/'
	end

end