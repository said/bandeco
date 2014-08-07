class CreateMenuscomments < ActiveRecord::Migration
  def change
    create_table :menuscomments do |t|
      t.references :menu, index: true
      t.foreign_key :menus
      t.string :commenter
      t.string :message

      t.timestamps
    end
  end
end
