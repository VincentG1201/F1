class CreateSeasonDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :season_drivers do |t|
      t.integer :year, null: false
      t.string :driver_id, null: false
      t.integer :total_race_entries, default: 0
      t.integer :total_race_starts, default: 0
      t.integer :total_race_wins, default: 0
      t.integer :total_race_laps, default: 0
      t.integer :total_podiums, default: 0
      t.decimal :total_points, precision: 8, scale: 2, default: 0
      t.integer :total_pole_positions, default: 0
      t.integer :total_fastest_laps, default: 0
      t.integer :total_driver_of_the_day, default: 0
      t.integer :best_race_result
      t.integer :best_starting_grid_position
    end
    add_index :season_drivers, [:year, :driver_id], unique: true
    add_index :season_drivers, :driver_id
  end
end