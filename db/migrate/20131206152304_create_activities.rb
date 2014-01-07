class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.references :learning_goal, index: true

      t.timestamps
    end
  end
end
