class Activity < ActiveRecord::Base
  has_many :pomodoros
  has_many :today_activities 
end
