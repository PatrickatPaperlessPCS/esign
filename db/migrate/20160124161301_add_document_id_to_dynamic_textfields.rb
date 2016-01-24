class AddDocumentIdToDynamicTextfields < ActiveRecord::Migration
  def change
    add_column :dynamic_textfields, :document_id, :integer
  end
end
