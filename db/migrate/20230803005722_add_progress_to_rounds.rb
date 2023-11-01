class AddProgressToRounds < ActiveRecord::Migration[7.0]
  def change
    add_column :rounds, :progress, :integer, default: 0
  end
end
