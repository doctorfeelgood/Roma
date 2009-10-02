class CreateExercises < ActiveRecord::Migration
  def self.up
    create_table :exercises do |t|
      t.string :name, :description
      t.integer :category_id
      t.timestamps
    end
  end

  def self.down
    drop_table :exercises
  end
end
