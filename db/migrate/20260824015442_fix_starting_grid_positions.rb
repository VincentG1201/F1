class FixStartingGridPositions < ActiveRecord::Migration[7.1]
  def change
    remove_column :starting_grid_positions, :q1, :string
    remove_column :starting_grid_positions, :q2, :string
    remove_column :starting_grid_positions, :q3, :string
    remove_column :starting_grid_positions, :gap, :string

    add_column :starting_grid_positions, :driver_number, :string
    add_column :starting_grid_positions, :engine_manufacturer_id, :string
    add_column :starting_grid_positions, :tyre_manufacturer_id, :string
    add_column :starting_grid_positions, :qualification_position_number, :integer
    add_column :starting_grid_positions, :qualification_position_text, :string
    add_column :starting_grid_positions, :grid_penalty, :string
    add_column :starting_grid_positions, :grid_penalty_positions, :integer
    add_column :starting_grid_positions, :time, :string
    add_column :starting_grid_positions, :time_millis, :decimal
  end
end