class AddAttachmentAttachment1ToTemplates < ActiveRecord::Migration
  def self.up
    change_table :templates do |t|
      t.attachment :attachment1
    end
  end

  def self.down
    remove_attachment :templates, :attachment1
  end
end
