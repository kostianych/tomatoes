require 'test_helper'

class TodayActivityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "has_many" do
    today_activities = TodayActivity.find(:all, 
      :conditions => "today = '2010-01-05'",
      :joins => ", activities as a on today_activities.activity_id = a.id",
      :order => "a.priority")
    i = 0
    today_activities.each do |today_activity|
      assert "2010-01-05", today_activity.today
      i = i + 1
    end
    
    assert_equal 2, i
    
    assert_equal 2, today_activities.count
    assert_not_nil today_activities[0]
    assert_equal "MyComment", today_activities[0].activity.comment
  end
  
end
