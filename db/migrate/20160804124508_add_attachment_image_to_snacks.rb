class AddAttachmentImageToSnacks < ActiveRecord::Migration
  def self.up
    change_table :snacks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :snacks, :image
  end
end
