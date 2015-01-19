require 'spec_helper'
require 'find_dead_link/url_opener'

describe FindDeadLink::UrlOpener do

  describe '#dead_link?' do
    it "should not contain dead link" do
      FindDeadLink::UrlOpener.new(@valid_url).dead_link?.should be_true
    end
  end

  describe '#get_content' do
    it "valid url should contain html content" do
      FindDeadLink::UrlOpener.new(@valid_url).get_content.to_s.should include 'body'
    end

    it "invalid url should not contain html content" do
      FindDeadLink::UrlOpener.new(@invalid_url).get_content.to_s.should_not include 'body'
    end
  end

end