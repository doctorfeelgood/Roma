class ChangePrecision < ActiveRecord::Migration
  def self.up
    remove_column :rates, :price
    add_column :rates, :price, :decimal, :precision => 6, :scale => 2
  end

  def self.down
    remove_column :rates, :price
    add_column :rates, :price, :decimal, :precision => 6, :scale => 2
  end
end
