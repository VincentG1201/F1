class CreateSeasons < ActiveRecord::Migration[7.1]
  def change
    create_table :seasons, id: false do |t|
      t.integer :year, primary_key: true
    end
  end
end