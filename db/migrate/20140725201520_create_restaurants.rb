class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.references :campusunit, index: true
      t.foreign_key :campusunits
      t.string :name
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end
