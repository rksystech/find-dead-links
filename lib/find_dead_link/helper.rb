module FindDeadLink
	module Helper

		URL_PREFIX = ['http','https','www']
		
		def get_url(url)
			URL_PREFIX.each{ |prefix| return url if url.start_with?(prefix) }
			URI.join(@base_url, url).to_s
		end
		
	end
end