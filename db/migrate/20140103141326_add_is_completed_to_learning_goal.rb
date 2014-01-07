class AddIsCompletedToLearningGoal < ActiveRecord::Migration
  def change
    add_column :learning_goals, :is_completed, :boolean, :null => false, :default => false
  end
end
