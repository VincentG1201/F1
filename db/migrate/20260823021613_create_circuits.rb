class CreateCircuits < ActiveRecord::Migration[7.1]
  def change
    create_table :circuits, id: false do |t|
      t.string :id, primary_key: true
      t.string :name, null: false
      t.string :full_name, null: false
      t.text :previous_names       # store as comma-separated or jsonb later if needed
      t.string :circuit_type       # RACE / ROAD / STREET
      t.string :direction          # CLOCKWISE / ANTI_CLOCKWISE
      t.string :place_name, null: false
      t.string :country_id, null: false
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6
      t.decimal :length, precision: 6, scale: 3
      t.integer :turns
      t.integer :total_races_held, default: 0
    end
    add_index :circuits, :country_id
  end
end