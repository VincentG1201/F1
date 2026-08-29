class CreateRaceConstructorStandings < ActiveRecord::Migration[7.1]
  def change
    create_table :race_constructor_standings do |t|
      t.integer :race_id, null: false
      t.string :constructor_id, null: false
      t.integer :position_display_order, null: false
      t.integer :position_number
      t.string :position_text, null: false
      t.decimal :points, precision: 8, scale: 2, null: false
      t.integer :positions_gained
      t.boolean :championship_won, default: false
    end
    add_index :race_constructor_standings, :race_id
    add_index :race_constructor_standings, :constructor_id
    add_index :race_constructor_standings, [:race_id, :position_number]
  end
end