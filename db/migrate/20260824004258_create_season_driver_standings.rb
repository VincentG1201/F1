class CreateSeasonDriverStandings < ActiveRecord::Migration[7.1]
  def change
    create_table :season_driver_standings do |t|
      t.integer :year, null: false
      t.string :driver_id, null: false
      t.integer :position_display_order, null: false
      t.integer :position_number
      t.string :position_text, null: false
      t.decimal :points, precision: 8, scale: 2, null: false
    end
    add_index :season_driver_standings, :year
    add_index :season_driver_standings, :driver_id
    add_index :season_driver_standings, [:year, :position_number]
  end
end