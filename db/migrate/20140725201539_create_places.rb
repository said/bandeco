class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.references :placescategory, index: true
      t.foreign_key :placescategories
      t.string :name
      t.string :address
      t.string :tel
      t.string :latitude
      t.string :longitude
      t.text :metatags

      t.timestamps
    end
  end
end
