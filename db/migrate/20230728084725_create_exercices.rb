class CreateExercices < ActiveRecord::Migration[7.0]
  def change
    create_table :exercices do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
