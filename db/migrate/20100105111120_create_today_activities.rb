class CreateTodayActivities < ActiveRecord::Migration
  def self.up
    create_table :today_activities do |t|
      t.date :today
      t.integer :activity_id

      t.timestamps
    end
  end

  def self.down
    drop_table :today_activities
  end
end
