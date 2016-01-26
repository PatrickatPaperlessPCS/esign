class AddReminderToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :reminder, :boolean
  end
end
