require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  def setup
    @activity = Activity.find(1)
    @one = activities(:one)
    @two = activities(:two)
    @three = activities(:three)
  end

  def test_create    
    assert_kind_of Activity,               @activity
    assert_equal @one.id,                  @activity.id
    assert_equal @one.priority,            @activity.priority
    assert_equal @one.deadline,            @activity.deadline
    assert_equal @one.description,         @activity.description
    assert_equal @one.estimated_pomodoros, @activity.estimated_pomodoros
    assert_equal @one.comment,             @activity.comment
  end

  def test_mandatory
    @activity = Activity.find(3)    
    assert_kind_of Activity,                 @activity
    assert_equal @three.priority,            @activity.priority
    assert_equal @three.description,         @activity.description
    assert_equal @three.estimated_pomodoros, @activity.estimated_pomodoros
    assert_equal @three.comment,             @activity.comment
    assert_equal nil,                        @activity.deadline
  end
  
  def test_update
    @activity.priority =            @two.priority
    @activity.deadline =            @two.deadline
    @activity.description =         @two.description
    @activity.estimated_pomodoros = @two.estimated_pomodoros
    @activity.comment =             @two.comment
    
    assert @activity.save, @activity.errors.full_messages.join("; ")
    @activity.reload

    assert_equal @one.id,                  @activity.id
    assert_equal @two.priority,            @activity.priority
    assert_equal @two.deadline,            @activity.deadline
    assert_equal @two.description,         @activity.description
    assert_equal @two.estimated_pomodoros, @activity.estimated_pomodoros
    assert_equal @two.comment,             @activity.comment
  end
  
  def test_destroy
    @activity.destroy
    assert_raise(ActiveRecord::RecordNotFound) { Activity.find(@activity.id) }
  end

end
