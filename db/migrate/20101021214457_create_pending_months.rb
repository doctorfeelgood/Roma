class CreatePendingMonths < ActiveRecord::Migration
  def self.up
    create_table :pending_months do |t|
		t.integer :membership_id, :rate_id, :attendances
		t.date :period_begins, :period_ends
		t.timestamps
    end
  end

  def self.down
    drop_table :pending_months
  end
end
