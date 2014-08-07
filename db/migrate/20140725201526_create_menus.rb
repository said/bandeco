class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.date :day
      t.references :restaurant, index: true
      t.foreign_key :restaurants
      t.references :meal, index: true
      t.foreign_key :meals
      t.text :options
      t.string :kcal

      t.timestamps
    end
  end
end
