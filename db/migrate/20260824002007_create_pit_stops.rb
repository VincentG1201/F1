class CreatePitStops < ActiveRecord::Migration[7.1]
  def change
    create_table :pit_stops do |t|
      t.integer :race_id, null: false
      t.string :driver_id, null: false
      t.string :constructor_id, null: false
      t.integer :stop_number
      t.integer :lap
      t.string :time
      t.string :time_millis
    end
    add_index :pit_stops, :race_id
  end
end