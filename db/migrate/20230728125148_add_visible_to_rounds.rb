class AddVisibleToRounds < ActiveRecord::Migration[7.0]
  def change
    add_column :rounds, :visible, :boolean, default: false
  end
end
