require 'spec_helper'
require 'find_dead_link/helper'
require 'find_dead_link/html_doc'

describe FindDeadLink::HtmlDoc do

  before(:each) do
    @html_doc = FindDeadLink::HtmlDoc.new(Nokogiri::HTML(open(@valid_url)),URI(@valid_url).host, @valid_url)
  end

  describe '#get_links' do
    it "should return links for valid url" do
      @html_doc.get_links.should_not be_empty
    end
  end

  describe '#ignore?' do
    it "should ignore urls started with ignored string" do
     ['#', 'javascript', 'mailto'].each do |ignore_string|
        url = "#{ignore_string+@valid_url}"
        @html_doc.ignore?(url).should be_true
      end
    end

    it "should ignore blank url" do
      url = nil
      @html_doc.ignore?(url).should be_true
    end

    it "should ignore external url" do
      url = 'https://facebook.com'
      @html_doc.ignore?(url).should be_true
    end

    it "should ignore urls end with ignored extension" do
      ['.csv','.xls','.pdf','.jpg'].each do |ignore_extension|
        url = "#{@valid_url+ignore_extension}"
        @html_doc.ignore?(url).should be_true
      end
    end

    it "should not ignore valid url" do
      @html_doc.ignore?(@valid_url).should be_false
    end
  end

end