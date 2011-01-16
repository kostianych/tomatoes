class CreateActivityInventories < ActiveRecord::Migration
  def self.up
    create_table :activity_inventories do |t|
      t.integer :activity_id
      t.integer :priority

      t.timestamps
    end
  end

  def self.down
    drop_table :activity_inventories
  end
end
