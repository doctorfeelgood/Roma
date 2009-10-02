class CreateRoutines < ActiveRecord::Migration
  def self.up
    create_table :routines do |t|
      t.string :name, :comments
      t.integer :member_id
      t.timestamps
    end
  end

  def self.down
    drop_table :routines
  end
end
