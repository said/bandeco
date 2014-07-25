class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.date :day
      t.references :restaurant, index: true
      t.references :meal, index: true
      t.text :options
      t.string :kcal

      t.timestamps
    end
  end
end
