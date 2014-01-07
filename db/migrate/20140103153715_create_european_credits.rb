class CreateEuropeanCredits < ActiveRecord::Migration
  def change
    create_table :european_credits do |t|
      t.integer :amount
      t.string :level
      t.references :competence, index: true

      t.timestamps
    end
  end
end
