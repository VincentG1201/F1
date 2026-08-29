class CreateGrandsPrix < ActiveRecord::Migration[7.1]
  def change
    create_table :grands_prix, id: false do |t|
      t.string :id, primary_key: true
      t.string :name, null: false
      t.string :full_name, null: false
      t.string :short_name, null: false
      t.string :abbreviation, limit: 3, null: false
      t.string :country_id
      t.integer :total_races_held, default: 0
    end
    add_index :grands_prix, :country_id
  end
end