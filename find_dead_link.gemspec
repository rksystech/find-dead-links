# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'find_dead_link/version'

Gem::Specification.new do |spec|
  spec.name        = "find_dead_link"
  spec.version     = FindDeadLink::VERSION
  spec.summary     = "Looks for deadlinks exists in provided url"
  spec.date        = "2014-04-01"
  spec.description = "The library takes a url and search for deadlinks within given website"
  spec.authors     = ["Rajiv"]
  spec.email       = ["rkapil@systango.com"]
  spec.homepage    = "http://systango.com/"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6.1"
  
  spec.add_dependency 'semantic_logger', '~> 2.7.0'
	
  spec.add_development_dependency "pry"
end