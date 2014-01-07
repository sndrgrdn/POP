class CreateLearningGoals < ActiveRecord::Migration
  def change
    create_table :learning_goals do |t|
      t.string :name
      t.references :competence, index: true

      t.timestamps
    end
  end
end
