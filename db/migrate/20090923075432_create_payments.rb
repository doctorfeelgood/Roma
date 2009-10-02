class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :membership_id, :rate_id, :paid_month, :paid_year
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
