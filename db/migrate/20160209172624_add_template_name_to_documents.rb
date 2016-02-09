class AddTemplateNameToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :template_name, :string
  end
end
