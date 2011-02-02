class AddUptodateToMemberships < ActiveRecord::Migration
  def self.up
  		add_column :memberships, :is_up_to_date, :boolean, :default=>true
  		add_column :memberships, :last_checked_month, :integer, :default=>nil
  end

  def self.down
  		remove_column :memberships, :is_up_to_date
  		remove_column :membershiops, :last_checked_month
  end
end
