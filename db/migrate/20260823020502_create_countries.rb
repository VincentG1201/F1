class CreateCountries < ActiveRecord::Migration[8.1]
  def change
    create_table :countries, id: false do |t|
      t.string :id, primary_key: true
      t.string :alpha2_code, limit: 2, null: false
      t.string :alpha3_code, limit: 3, null: false
      t.string :ioc_code, limit: 3
      t.string :name, null: false
      t.string :demonym
      t.string :continent_id, null: false
    end
    add_index :countries, :continent_id
  end
end