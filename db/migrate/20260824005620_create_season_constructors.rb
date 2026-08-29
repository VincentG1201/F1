class CreateSeasonConstructors < ActiveRecord::Migration[7.1]
  def change
    create_table :season_constructors do |t|
      t.integer :year, null: false
      t.string :constructor_id, null: false
      t.integer :total_race_entries, default: 0
      t.integer :total_race_starts, default: 0
      t.integer :total_race_wins, default: 0
      t.integer :total_race_laps, default: 0
      t.integer :total_podiums, default: 0
      t.decimal :total_points, precision: 8, scale: 2, default: 0
      t.integer :total_pole_positions, default: 0
      t.integer :total_fastest_laps, default: 0
      t.integer :best_race_result
      t.integer :best_starting_grid_position
    end
    add_index :season_constructors, [:year, :constructor_id], unique: true
    add_index :season_constructors, :constructor_id
  end
end