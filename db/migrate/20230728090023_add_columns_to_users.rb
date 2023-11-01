class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer
    add_column :users, :language, :integer
    add_reference :users, :city_quarter, null: false, foreign_key: true
    add_column :users, :cw_nickname, :string
  end
end
