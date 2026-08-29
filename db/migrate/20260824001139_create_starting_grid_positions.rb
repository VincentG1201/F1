class CreateStartingGridPositions < ActiveRecord::Migration[7.1]
  def change
    create_table :starting_grid_positions do |t|
      t.integer :race_id, null: false
      t.string :driver_id, null: false
      t.string :constructor_id, null: false
      t.integer :position_display_order
      t.integer :position_number
      t.string :position_text, null: false
      t.string :q1
      t.string :q2
      t.string :q3
      t.string :gap
    end
    add_index :starting_grid_positions, :race_id
    add_index :starting_grid_positions, [:race_id, :position_number]
  end
end