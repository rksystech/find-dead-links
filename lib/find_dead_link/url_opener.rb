require 'net/http'
module FindDeadLink
  class UrlOpener
    include SemanticLogger::Loggable
    ERROR_CODES = ['404','403','500']

    def initialize(url)
      @url = url
    end

    def dead_link?
      begin
        ERROR_CODES.include?(Net::HTTP.get_response(URI(@url)).code)
      rescue StandardError => e
        logger.error "DEADLINK :: Error in opening URL:: #{@url}", error: e.inspect
        return true
      end
    end

    def get_content
      begin
        Nokogiri::HTML(open(@url))
      rescue StandardError => e
        logger.error "Error in parsing content for URL:: #{@url}", error: e.inspect
        Nokogiri::HTML("")
      end
    end
  end
end