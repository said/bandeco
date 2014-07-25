class CreateRestaurantopeninghours < ActiveRecord::Migration
  def change
    create_table :restaurantopeninghours do |t|
      t.references :restaurant, index: true
      t.references :meal, index: true
      t.integer :wday
      t.string :open
      t.string :close

      t.timestamps
    end
  end
end
