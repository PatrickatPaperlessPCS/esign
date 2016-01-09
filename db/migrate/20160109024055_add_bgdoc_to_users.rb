class AddBgdocToUsers < ActiveRecord::Migration
  def up
    add_attachment :users, :bgdoc
  end

  def down
    remove_attachment :users, :bgdoc
  end
end
