class AddActiveToMemberships < ActiveRecord::Migration
  def self.up
  	  	add_column :memberships, :active, :boolean, :default=>true
  end

  def self.down
  	remove_column :memberships, :active
  end
end
