class CreateRaceResults < ActiveRecord::Migration[7.1]
  def change
    create_table :race_results do |t|
      t.integer :race_id, null: false
      t.string :driver_id, null: false
      t.string :constructor_id, null: false
      t.string :engine_manufacturer_id
      t.string :tyre_manufacturer_id
      t.integer :position_display_order
      t.integer :position_number
      t.string :position_text, null: false
      t.string :driver_number
      t.integer :grid_position_number
      t.integer :laps
      t.string :time
      t.decimal :time_millis
      t.string :gap
      t.string :interval
      t.decimal :points, precision: 6, scale: 2, default: 0
      t.string :reason_retired
    end
    add_index :race_results, :race_id
    add_index :race_results, :driver_id
    add_index :race_results, :constructor_id
    add_index :race_results, [:race_id, :position_number]
  end
end