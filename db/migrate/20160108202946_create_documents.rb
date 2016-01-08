class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :user_id
      t.string :signature
      t.string :date
      t.string :text1

      t.timestamps null: false
    end
  end
end
