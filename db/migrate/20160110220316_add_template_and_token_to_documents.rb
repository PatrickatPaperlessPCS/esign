class AddTemplateAndTokenToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :template_id, :integer
    add_column :documents, :authentication_token, :string
  end
end
