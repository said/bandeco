class CreateRestaurantopeninghours < ActiveRecord::Migration
  def change
    create_table :restaurantopeninghours do |t|
      t.references :restaurant, index: true
      t.foreign_key :restaurants
      t.references :meal, index: true
      t.foreign_key :meals
      t.integer :wday
      t.string :open
      t.string :close

      t.timestamps
    end
  end
end
