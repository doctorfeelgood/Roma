class AddMonthToPendingMonths < ActiveRecord::Migration
  def self.up
  	add_column :pending_months, :month, :integer, :default=>true
  end

  def self.down
  	remove_column :pending_months, :month
  end
end
