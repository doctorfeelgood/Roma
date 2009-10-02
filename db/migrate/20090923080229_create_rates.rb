class CreateRates < ActiveRecord::Migration
  def self.up
    create_table :rates do |t|
      t.string :name
      t.decimal :price, :precision => 4, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :rates
  end
end
