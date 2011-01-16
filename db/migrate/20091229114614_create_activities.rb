class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer :id
      t.integer :priority
      t.date :deadline
      t.text :description
      t.integer :estimated_pomodoros
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
