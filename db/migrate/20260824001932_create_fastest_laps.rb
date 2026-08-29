class CreateFastestLaps < ActiveRecord::Migration[7.1]
  def change
    create_table :fastest_laps do |t|
      t.integer :race_id, null: false
      t.string :driver_id, null: false
      t.string :constructor_id, null: false
      t.integer :position_number
      t.integer :lap
      t.string :time
      t.decimal :time_millis
    end
    add_index :fastest_laps, :race_id
  end
end