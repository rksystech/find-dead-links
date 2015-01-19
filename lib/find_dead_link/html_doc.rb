module FindDeadLink
	class HtmlDoc
		include FindDeadLink::Helper

		IGNORE_URLS_START_WITH = ['#', 'javascript', 'mailto']
		IGNORE_URLS_END_WITH = ['.csv','.xls','.pdf','.jpg']


		def initialize(html_content, host, base_url)
			@html_content = html_content
			@host = host
			@base_url = base_url
		end

		def get_links
			@html_content.css('a').collect do |link| 
				link["href"] unless ignore?(link["href"])
			end.compact
		end

		def ignore?(url)
			url.nil? or start_with_ignore?(url) or end_with_ignore?(url) or external_url?(get_url(url))
		end

		def external_url?(url)
			!(@host == URI(url).host rescue false)
		end

		['start_with', 'end_with'].each do |method|
			define_method "#{method}_ignore?" do |url|
				eval("IGNORE_URLS_#{method.upcase}").each{ |value| return true if url.send("#{method}?", value)  }
				false
			end
		end
		
	end
end