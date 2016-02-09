class CreateSignaturePositions < ActiveRecord::Migration
  def change
    create_table :signature_positions do |t|
      t.integer :left
      t.integer :top
	  t.references :template
	  
      t.timestamps null: false
    end
  end
end
