require "selenium-webdriver"
require "test/unit"

class AddActivity < Test::Unit::TestCase

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

    verify_label_not_present("Id")
    verify_element_not_present(:id, "activity_id")
    verify_selected_value("activity_deadline_1i", "")
    verify_selected_value("activity_deadline_2i", "")
    verify_selected_value("activity_deadline_3i", "")
    type "activity_priority", "20"
    type "activity_description", "Description here"
    type "activity_estimated_pomodoros", "2"
    type "activity_comment", "Difficult task"
    
    @driver.find_element(:id, "activity_submit").click
    #wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    #wait.until { driver.title.downcase.start_with? "cheese!" }
    assert_equal "Activities: index", @driver.title
    verify_text_present "Activity was successfully created."
    verify_text_present "20"
    verify_text_present "	Description here"
    verify_text_present "2"
    verify_text_present "Difficult task"    
  end

  def type(id, value)
    element = @driver.find_element(:id, id)
    element.send_keys value
  end
  
  def verify_selected_value(id, value)
    element = @driver.find_element(:id, id)
    assert !element.selected?
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def verify_element_not_present(how, what)
      !element_present?(how, what)
  end

  def verify_label_not_present(text)
    labels = @driver.find_elements(:tag_name, "label")
    labels.each do |label|
      assert(label.text != text)    
    end
    rescue Test::Unit::AssertionFailedError => ex
      @verification_errors << ex
	end

  def verify_text_present(text)
    @driver.page_source.to_s.include?(text)
	end
  
  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
end
