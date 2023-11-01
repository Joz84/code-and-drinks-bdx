class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.integer :rank
      t.references :exercice, null: false, foreign_key: true
      t.references :city_quarter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
