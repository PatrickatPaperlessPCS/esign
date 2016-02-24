class ProcessedAttachementUrl < ActiveRecord::Migration
  def change
  	add_column :templates, :processed_attachement_url, :string
  end
end
