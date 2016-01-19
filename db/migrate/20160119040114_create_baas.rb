class CreateBaas < ActiveRecord::Migration
  def change
    create_table :baas do |t|
      t.string :signature
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
