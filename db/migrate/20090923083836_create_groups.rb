class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :member_id, :rate_id
      t.boolean :is_complete
      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
