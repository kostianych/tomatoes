class CreatePomodoros < ActiveRecord::Migration
  def self.up
    create_table :pomodoros do |t|
      t.integer :id
      t.integer :activity_id
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :interruption_type

      t.timestamps
    end
  end

  def self.down
    drop_table :pomodoros
  end
end
