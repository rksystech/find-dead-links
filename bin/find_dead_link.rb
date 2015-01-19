#!/usr/bin/env ruby

require_relative '../lib/find_dead_link'
require 'optparse'

url = nil
OptionParser.new do |opts|
  opts.banner = "Usage: find_dead_link.rb -l <url>"

  opts.on("-url", "-l") do |l|
    url = l
  end
end.parse!

::FindDeadLink::Crawler.new(url).crawl
