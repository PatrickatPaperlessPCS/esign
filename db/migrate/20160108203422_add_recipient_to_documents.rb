class AddRecipientToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :recipient, :string
  end
end
