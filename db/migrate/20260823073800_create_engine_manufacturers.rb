class CreateEngineManufacturers < ActiveRecord::Migration[7.1]
  def change
    create_table :engine_manufacturers, id: false do |t|
      t.string :id, primary_key: true
      t.string :name, null: false
      t.string :country_id, null: false
      t.integer :best_championship_position
      t.integer :best_starting_grid_position
      t.integer :best_race_result
      t.integer :best_sprint_race_result
      t.integer :total_championship_wins, default: 0
      t.integer :total_race_entries, default: 0
      t.integer :total_race_starts, default: 0
      t.integer :total_race_wins, default: 0
      t.integer :total_race_laps, default: 0
      t.integer :total_podiums, default: 0
      t.integer :total_podium_races, default: 0
      t.decimal :total_points, precision: 8, scale: 2, default: 0
      t.decimal :total_championship_points, precision: 8, scale: 2, default: 0
      t.integer :total_pole_positions, default: 0
      t.integer :total_fastest_laps, default: 0
      t.integer :total_sprint_race_starts, default: 0
      t.integer :total_sprint_race_wins, default: 0
    end
  end
end