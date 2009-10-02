class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :name, :last_name, :phone, :email, :address
      t.integer :member_number, :created_by

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
