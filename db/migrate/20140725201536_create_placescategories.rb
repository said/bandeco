class CreatePlacescategories < ActiveRecord::Migration
  def change
    create_table :placescategories do |t|
      t.references :campusunit, index: true
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
