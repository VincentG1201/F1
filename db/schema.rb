# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_08_24_015442) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "circuits", id: :string, force: :cascade do |t|
    t.string "circuit_type"
    t.string "country_id", null: false
    t.string "direction"
    t.string "full_name", null: false
    t.decimal "latitude", precision: 9, scale: 6
    t.decimal "length", precision: 6, scale: 3
    t.decimal "longitude", precision: 9, scale: 6
    t.string "name", null: false
    t.string "place_name", null: false
    t.text "previous_names"
    t.integer "total_races_held", default: 0
    t.integer "turns"
    t.index ["country_id"], name: "index_circuits_on_country_id"
  end

  create_table "constructors", id: :string, force: :cascade do |t|
    t.integer "best_championship_position"
    t.integer "best_race_result"
    t.integer "best_sprint_race_result"
    t.integer "best_starting_grid_position"
    t.string "country_id", null: false
    t.string "full_name", null: false
    t.string "name", null: false
    t.integer "total_1_and_2_finishes", default: 0
    t.decimal "total_championship_points", precision: 8, scale: 2, default: "0.0"
    t.integer "total_championship_wins", default: 0
    t.integer "total_fastest_laps", default: 0
    t.integer "total_podium_races", default: 0
    t.integer "total_podiums", default: 0
    t.decimal "total_points", precision: 8, scale: 2, default: "0.0"
    t.integer "total_pole_positions", default: 0
    t.integer "total_race_entries", default: 0
    t.integer "total_race_laps", default: 0
    t.integer "total_race_starts", default: 0
    t.integer "total_race_wins", default: 0
    t.integer "total_sprint_race_starts", default: 0
    t.integer "total_sprint_race_wins", default: 0
    t.index ["country_id"], name: "index_constructors_on_country_id"
  end

  create_table "continents", id: :string, force: :cascade do |t|
    t.string "code", limit: 2, null: false
    t.string "demonym"
    t.string "name", null: false
  end

  create_table "countries", id: :string, force: :cascade do |t|
    t.string "alpha2_code", limit: 2, null: false
    t.string "alpha3_code", limit: 3, null: false
    t.string "continent_id", null: false
    t.string "demonym"
    t.string "ioc_code", limit: 3
    t.string "name", null: false
    t.index ["continent_id"], name: "index_countries_on_continent_id"
  end

  create_table "drivers", id: :string, force: :cascade do |t|
    t.string "abbreviation", limit: 3, null: false
    t.integer "best_championship_position"
    t.integer "best_race_result"
    t.integer "best_sprint_race_result"
    t.integer "best_starting_grid_position"
    t.string "country_of_birth_country_id"
    t.date "date_of_birth"
    t.date "date_of_death"
    t.string "first_name", null: false
    t.string "full_name", null: false
    t.string "gender"
    t.string "last_name", null: false
    t.string "name", null: false
    t.string "nationality_country_id"
    t.string "permanent_number"
    t.string "place_of_birth"
    t.string "second_nationality_country_id"
    t.decimal "total_championship_points", precision: 8, scale: 2, default: "0.0"
    t.integer "total_championship_wins", default: 0
    t.integer "total_driver_of_the_day", default: 0
    t.integer "total_fastest_laps", default: 0
    t.integer "total_grand_slams", default: 0
    t.integer "total_podiums", default: 0
    t.decimal "total_points", precision: 8, scale: 2, default: "0.0"
    t.integer "total_pole_positions", default: 0
    t.integer "total_race_entries", default: 0
    t.integer "total_race_laps", default: 0
    t.integer "total_race_starts", default: 0
    t.integer "total_race_wins", default: 0
    t.integer "total_sprint_race_starts", default: 0
    t.integer "total_sprint_race_wins", default: 0
    t.index ["nationality_country_id"], name: "index_drivers_on_nationality_country_id"
  end

  create_table "engine_manufacturers", id: :string, force: :cascade do |t|
    t.integer "best_championship_position"
    t.integer "best_race_result"
    t.integer "best_sprint_race_result"
    t.integer "best_starting_grid_position"
    t.string "country_id", null: false
    t.string "name", null: false
    t.decimal "total_championship_points", precision: 8, scale: 2, default: "0.0"
    t.integer "total_championship_wins", default: 0
    t.integer "total_fastest_laps", default: 0
    t.integer "total_podium_races", default: 0
    t.integer "total_podiums", default: 0
    t.decimal "total_points", precision: 8, scale: 2, default: "0.0"
    t.integer "total_pole_positions", default: 0
    t.integer "total_race_entries", default: 0
    t.integer "total_race_laps", default: 0
    t.integer "total_race_starts", default: 0
    t.integer "total_race_wins", default: 0
    t.integer "total_sprint_race_starts", default: 0
    t.integer "total_sprint_race_wins", default: 0
  end

  create_table "fastest_laps", force: :cascade do |t|
    t.string "constructor_id", null: false
    t.string "driver_id", null: false
    t.integer "lap"
    t.integer "position_number"
    t.integer "race_id", null: false
    t.string "time"
    t.decimal "time_millis"
    t.index ["race_id"], name: "index_fastest_laps_on_race_id"
  end

  create_table "grands_prix", id: :string, force: :cascade do |t|
    t.string "abbreviation", limit: 3, null: false
    t.string "country_id"
    t.string "full_name", null: false
    t.string "name", null: false
    t.string "short_name", null: false
    t.integer "total_races_held", default: 0
    t.index ["country_id"], name: "index_grands_prix_on_country_id"
  end

  create_table "pit_stops", force: :cascade do |t|
    t.string "constructor_id", null: false
    t.string "driver_id", null: false
    t.integer "lap"
    t.integer "race_id", null: false
    t.integer "stop_number"
    t.string "time"
    t.string "time_millis"
    t.index ["race_id"], name: "index_pit_stops_on_race_id"
  end

  create_table "qualifying_results", force: :cascade do |t|
    t.string "constructor_id", null: false
    t.string "driver_id", null: false
    t.string "gap"
    t.integer "position_display_order"
    t.integer "position_number"
    t.string "position_text", null: false
    t.string "q1"
    t.string "q2"
    t.string "q3"
    t.integer "race_id", null: false
    t.index ["race_id", "position_number"], name: "index_qualifying_results_on_race_id_and_position_number"
    t.index ["race_id"], name: "index_qualifying_results_on_race_id"
  end

  create_table "race_constructor_standings", force: :cascade do |t|
    t.boolean "championship_won", default: false
    t.string "constructor_id", null: false
    t.decimal "points", precision: 8, scale: 2, null: false
    t.integer "position_display_order", null: false
    t.integer "position_number"
    t.string "position_text", null: false
    t.integer "positions_gained"
    t.integer "race_id", null: false
    t.index ["constructor_id"], name: "index_race_constructor_standings_on_constructor_id"
    t.index ["race_id", "position_number"], name: "idx_on_race_id_position_number_118b8b4035"
    t.index ["race_id"], name: "index_race_constructor_standings_on_race_id"
  end

  create_table "race_driver_standings", force: :cascade do |t|
    t.boolean "championship_won", default: false
    t.string "driver_id", null: false
    t.decimal "points", precision: 8, scale: 2, null: false
    t.integer "position_display_order", null: false
    t.integer "position_number"
    t.string "position_text", null: false
    t.integer "positions_gained"
    t.integer "race_id", null: false
    t.index ["driver_id"], name: "index_race_driver_standings_on_driver_id"
    t.index ["race_id", "position_number"], name: "index_race_driver_standings_on_race_id_and_position_number"
    t.index ["race_id"], name: "index_race_driver_standings_on_race_id"
  end

  create_table "race_results", force: :cascade do |t|
    t.string "constructor_id", null: false
    t.string "driver_id", null: false
    t.string "driver_number"
    t.string "engine_manufacturer_id"
    t.string "gap"
    t.integer "grid_position_number"
    t.string "interval"
    t.integer "laps"
    t.decimal "points", precision: 6, scale: 2, default: "0.0"
    t.integer "position_display_order"
    t.integer "position_number"
    t.string "position_text", null: false
    t.integer "race_id", null: false
    t.string "reason_retired"
    t.string "time"
    t.decimal "time_millis"
    t.string "tyre_manufacturer_id"
    t.index ["constructor_id"], name: "index_race_results_on_constructor_id"
    t.index ["driver_id"], name: "index_race_results_on_driver_id"
    t.index ["race_id", "position_number"], name: "index_race_results_on_race_id_and_position_number"
    t.index ["race_id"], name: "index_race_results_on_race_id"
  end

  create_table "races", id: :serial, force: :cascade do |t|
    t.string "circuit_id", null: false
    t.string "circuit_layout_id"
    t.string "circuit_type"
    t.boolean "constructors_championship_decider", default: false
    t.decimal "course_length", precision: 6, scale: 3
    t.date "date", null: false
    t.string "direction"
    t.decimal "distance", precision: 7, scale: 3
    t.boolean "drivers_championship_decider", default: false
    t.string "grand_prix_id", null: false
    t.integer "laps"
    t.string "official_name", null: false
    t.string "qualifying_format"
    t.integer "round", null: false
    t.string "sprint_qualifying_format"
    t.string "time"
    t.integer "turns"
    t.integer "year", null: false
    t.index ["circuit_id"], name: "index_races_on_circuit_id"
    t.index ["grand_prix_id"], name: "index_races_on_grand_prix_id"
    t.index ["year"], name: "index_races_on_year"
  end

  create_table "season_constructor_standings", force: :cascade do |t|
    t.string "constructor_id", null: false
    t.decimal "points", precision: 8, scale: 2, null: false
    t.integer "position_display_order", null: false
    t.integer "position_number"
    t.string "position_text", null: false
    t.integer "year", null: false
    t.index ["constructor_id"], name: "index_season_constructor_standings_on_constructor_id"
    t.index ["year", "position_number"], name: "index_season_constructor_standings_on_year_and_position_number"
    t.index ["year"], name: "index_season_constructor_standings_on_year"
  end

  create_table "season_constructors", force: :cascade do |t|
    t.integer "best_race_result"
    t.integer "best_starting_grid_position"
    t.string "constructor_id", null: false
    t.integer "total_fastest_laps", default: 0
    t.integer "total_podiums", default: 0
    t.decimal "total_points", precision: 8, scale: 2, default: "0.0"
    t.integer "total_pole_positions", default: 0
    t.integer "total_race_entries", default: 0
    t.integer "total_race_laps", default: 0
    t.integer "total_race_starts", default: 0
    t.integer "total_race_wins", default: 0
    t.integer "year", null: false
    t.index ["constructor_id"], name: "index_season_constructors_on_constructor_id"
    t.index ["year", "constructor_id"], name: "index_season_constructors_on_year_and_constructor_id", unique: true
  end

  create_table "season_driver_standings", force: :cascade do |t|
    t.string "driver_id", null: false
    t.decimal "points", precision: 8, scale: 2, null: false
    t.integer "position_display_order", null: false
    t.integer "position_number"
    t.string "position_text", null: false
    t.integer "year", null: false
    t.index ["driver_id"], name: "index_season_driver_standings_on_driver_id"
    t.index ["year", "position_number"], name: "index_season_driver_standings_on_year_and_position_number"
    t.index ["year"], name: "index_season_driver_standings_on_year"
  end

  create_table "season_drivers", force: :cascade do |t|
    t.integer "best_race_result"
    t.integer "best_starting_grid_position"
    t.string "driver_id", null: false
    t.integer "total_driver_of_the_day", default: 0
    t.integer "total_fastest_laps", default: 0
    t.integer "total_podiums", default: 0
    t.decimal "total_points", precision: 8, scale: 2, default: "0.0"
    t.integer "total_pole_positions", default: 0
    t.integer "total_race_entries", default: 0
    t.integer "total_race_laps", default: 0
    t.integer "total_race_starts", default: 0
    t.integer "total_race_wins", default: 0
    t.integer "year", null: false
    t.index ["driver_id"], name: "index_season_drivers_on_driver_id"
    t.index ["year", "driver_id"], name: "index_season_drivers_on_year_and_driver_id", unique: true
  end

  create_table "seasons", primary_key: "year", id: :serial, force: :cascade do |t|
  end

  create_table "starting_grid_positions", force: :cascade do |t|
    t.string "constructor_id", null: false
    t.string "driver_id", null: false
    t.string "driver_number"
    t.string "engine_manufacturer_id"
    t.string "grid_penalty"
    t.integer "grid_penalty_positions"
    t.integer "position_display_order"
    t.integer "position_number"
    t.string "position_text", null: false
    t.integer "qualification_position_number"
    t.string "qualification_position_text"
    t.integer "race_id", null: false
    t.string "time"
    t.decimal "time_millis"
    t.string "tyre_manufacturer_id"
    t.index ["race_id", "position_number"], name: "index_starting_grid_positions_on_race_id_and_position_number"
    t.index ["race_id"], name: "index_starting_grid_positions_on_race_id"
  end

  create_table "tyre_manufacturers", id: :string, force: :cascade do |t|
    t.integer "best_championship_position"
    t.integer "best_race_result"
    t.integer "best_sprint_race_result"
    t.integer "best_starting_grid_position"
    t.string "country_id", null: false
    t.string "name", null: false
    t.decimal "total_championship_points", precision: 8, scale: 2, default: "0.0"
    t.integer "total_championship_wins", default: 0
    t.integer "total_fastest_laps", default: 0
    t.integer "total_podium_races", default: 0
    t.integer "total_podiums", default: 0
    t.decimal "total_points", precision: 8, scale: 2, default: "0.0"
    t.integer "total_pole_positions", default: 0
    t.integer "total_race_entries", default: 0
    t.integer "total_race_laps", default: 0
    t.integer "total_race_starts", default: 0
    t.integer "total_race_wins", default: 0
    t.integer "total_sprint_race_starts", default: 0
    t.integer "total_sprint_race_wins", default: 0
  end
end
