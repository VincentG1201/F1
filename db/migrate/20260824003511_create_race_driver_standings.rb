class CreateRaceDriverStandings < ActiveRecord::Migration[7.1]
  def change
    create_table :race_driver_standings do |t|
      t.integer :race_id, null: false
      t.string :driver_id, null: false
      t.integer :position_display_order, null: false
      t.integer :position_number
      t.string :position_text, null: false
      t.decimal :points, precision: 8, scale: 2, null: false
      t.integer :positions_gained
      t.boolean :championship_won, default: false
    end
    add_index :race_driver_standings, :race_id
    add_index :race_driver_standings, :driver_id
    add_index :race_driver_standings, [:race_id, :position_number]
  end
end