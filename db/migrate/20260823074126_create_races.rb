class CreateRaces < ActiveRecord::Migration[7.1]
  def change
    create_table :races, id: false do |t|
      t.integer :id, primary_key: true
      t.integer :year, null: false
      t.integer :round, null: false
      t.date :date, null: false
      t.string :time
      t.string :grand_prix_id, null: false
      t.string :official_name, null: false
      t.string :qualifying_format
      t.string :sprint_qualifying_format
      t.string :circuit_id, null: false
      t.string :circuit_layout_id
      t.string :circuit_type
      t.string :direction
      t.decimal :course_length, precision: 6, scale: 3
      t.integer :turns
      t.integer :laps
      t.decimal :distance, precision: 7, scale: 3
      t.boolean :drivers_championship_decider, default: false
      t.boolean :constructors_championship_decider, default: false
    end
    add_index :races, :grand_prix_id
    add_index :races, :circuit_id
    add_index :races, :year
  end
end