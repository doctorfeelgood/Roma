class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
	  t.string :username, :password, :name, :last_name, :landing_page
	  t.integer :role
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
