class AddRoleToRounds < ActiveRecord::Migration[7.0]
  def change
    add_column :rounds, :role, :integer
  end
end
