class CreateContinents < ActiveRecord::Migration[8.1]
  def change
    create_table :continents, id: false do |t|
      t.string :id, primary_key: true
      t.string :code, limit: 2, null: false
      t.string :name, null: false
      t.string :demonym
    end
  end
end
