class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers, id: false do |t|
      t.string :id, primary_key: true
      t.string :name, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :full_name, null: false
      t.string :abbreviation, limit: 3, null: false
      t.string :permanent_number
      t.string :gender
      t.date :date_of_birth
      t.date :date_of_death
      t.string :place_of_birth
      t.string :country_of_birth_country_id
      t.string :nationality_country_id
      t.string :second_nationality_country_id
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
      t.decimal :total_points, precision: 8, scale: 2, default: 0
      t.decimal :total_championship_points, precision: 8, scale: 2, default: 0
      t.integer :total_pole_positions, default: 0
      t.integer :total_fastest_laps, default: 0
      t.integer :total_sprint_race_starts, default: 0
      t.integer :total_sprint_race_wins, default: 0
      t.integer :total_driver_of_the_day, default: 0
      t.integer :total_grand_slams, default: 0
    end
    add_index :drivers, :nationality_country_id
  end
end