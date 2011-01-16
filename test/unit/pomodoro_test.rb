require 'test_helper'

class PomodoroTest < ActiveSupport::TestCase
  
  def setup
    @pomodoro = Pomodoro.find(1)
    @one = pomodoros(:one)
    @two = pomodoros(:two)
  end

  def test_create    
    assert_kind_of Pomodoro,             @pomodoro
    assert_equal @one.id,                @pomodoro.id
    assert_equal @one.activity_id,       @pomodoro.activity_id
    assert_equal @one.start_time,        @pomodoro.start_time
    assert_equal @one.end_time,          @pomodoro.end_time
    assert_equal @one.interruption_type, @pomodoro.interruption_type
  end
  
  def test_update
    @pomodoro.activity_id =       @two.activity_id
    @pomodoro.start_time =        @two.start_time
    @pomodoro.end_time =          @two.end_time
    @pomodoro.interruption_type = @two.interruption_type
    
    assert @pomodoro.save, @pomodoro.errors.full_messages.join("; ")
    @pomodoro.reload

    assert_equal @one.id,                 @pomodoro.id
    assert_equal @two.activity_id,        @pomodoro.activity_id
    assert_equal @two.start_time,         @pomodoro.start_time
    assert_equal @two.end_time,           @pomodoro.end_time
    assert_equal @two.interruption_type,  @pomodoro.interruption_type
  end
  
  def test_destroy
    @pomodoro.destroy
    assert_raise(ActiveRecord::RecordNotFound) { Pomodoro.find(@pomodoro.id) }
  end
  
end
