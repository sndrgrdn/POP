class AddIsCompletedToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :is_completed, :boolean, :null => false, :default => false
  end
end
