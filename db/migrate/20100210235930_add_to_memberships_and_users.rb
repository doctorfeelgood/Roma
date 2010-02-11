class AddToMembershipsAndUsers < ActiveRecord::Migration
  def self.up
    add_column :memberships, :pending_months, :integer
    add_column :memberships, :pay_day, :integer
    add_column :users, :salt, :string
    add_column :members, :is_female, :bool
  end

  def self.down
    add_column :memberships, :pending_months
    add_column :memberships, :pay_day
    add_column :users, :salt
    add_column :members, :is_female
  end
end
