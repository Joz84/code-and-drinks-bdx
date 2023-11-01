class AddKataToExercices < ActiveRecord::Migration[7.0]
  def change
    add_column :exercices, :kata, :integer
  end
end
