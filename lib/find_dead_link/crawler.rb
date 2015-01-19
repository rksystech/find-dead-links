module FindDeadLink
	class Crawler
		include SemanticLogger::Loggable
		include FindDeadLink::Helper

		URL_PREFIX = ['http','https','www']

		def initialize(url)
			raise BadUrlException unless (URI(url) rescue false)
			@base_url = url
			@host = URI(url).host
			@deadlinks = []
			@visited_links = []
		end

		def crawl
			visit(@base_url)
			logger.info("you have Deadlinks url #{@deadlinks}")
		end

	private
		def visit(url)
			logger.info("Visiting url #{url}")
			return if visited_url?(url)
			@visited_links << url
			url_opener = UrlOpener.new(url)
			return (@deadlinks << url) if url_opener.dead_link?
			links = HtmlDoc.new(url_opener.get_content, @host, @base_url).get_links
			links.each{|url| visit(get_url(url)) }
		end

		def visited_url?(url)
			@visited_links.include?(url)
		end

	end
end