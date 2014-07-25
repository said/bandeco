class CreateCampusunits < ActiveRecord::Migration
  def change
    create_table :campusunits do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
