require "selenium-webdriver"
require "test/unit"

class AddActivity2 < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end
  
  def test_add_activity
    @driver.get "http://0.0.0.0:3000/activities"
    @driver.find_element(:link, "New activity").click

    verify_text_not_present("Id")

    element = @driver.find_element(:id, 'activity_priority')
    element.send_keys "20"
    element.submit
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def verify_text_not_present(text)
    labels = @driver.find_elements(:tag_name, "label")
    labels.each do |label|
      assert(label.text != text)    
    end
    rescue Test::Unit::AssertionFailedError => ex
      @verification_errors << ex
	end
  
  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
end
