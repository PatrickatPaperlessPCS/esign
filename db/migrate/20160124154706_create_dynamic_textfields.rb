class CreateDynamicTextfields < ActiveRecord::Migration
  def change
    create_table :dynamic_textfields do |t|

      t.timestamps null: false
      t.string :text
      t.integer :left
      t.integer :top
    end
  end
end
