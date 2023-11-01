class CreateCityQuarters < ActiveRecord::Migration[7.0]
  def change
    create_table :city_quarters do |t|
      t.string :title

      t.timestamps
    end
  end
end
