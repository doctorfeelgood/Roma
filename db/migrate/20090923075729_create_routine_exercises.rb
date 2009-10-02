class CreateRoutineExercises < ActiveRecord::Migration
  def self.up
    create_table :routine_exercises do |t|
      t.integer :routine_id, :exercise_id, :sets, :reps, :super_set, :user_id
      t.string :comments
      t.timestamps
    end
  end

  def self.down
    drop_table :routine_exercises
  end
end
