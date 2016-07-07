class AddAttachmentImageToWorks < ActiveRecord::Migration
  def self.up
    change_table :works do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :works, :image
  end
end
