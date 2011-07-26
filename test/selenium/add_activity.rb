require "test/unit"
require "rubygems"
gem "selenium-client"
require "selenium/client"

class add_activity < Test::Unit::TestCase

  def setup
    @verification_errors = []
    @selenium = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*chrome",
      :url => "http://change-this-to-the-site-you-are-testing/",
      :timeout_in_second => 60

    @selenium.start_new_browser_session
  end
  
  def teardown
    @selenium.close_current_browser_session
    assert_equal [], @verification_errors
  end
  
  def test_add_activity
    @selenium.open "/activities"
    @selenium.click "link=New activity"
    @selenium.wait_for_page_to_load "30000"
  end
end
