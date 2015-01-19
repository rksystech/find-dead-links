require 'semantic_logger' unless defined?(logger)
require 'nokogiri'
require 'open-uri'
require 'pry'

SemanticLogger.default_level = :info
SemanticLogger.add_appender('find_dead_link.log')

module FindDeadLink
  GEM_ROOT = File.join(File.dirname(__FILE__), '..')
end

require_relative './find_dead_link/helper'
require_relative './find_dead_link/crawler'
require_relative './find_dead_link/html_doc'
require_relative './find_dead_link/url_opener'
require_relative './find_dead_link/version'
