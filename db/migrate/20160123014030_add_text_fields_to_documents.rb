class AddTextFieldsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :text2, :string
  end
end
