class AddAttachmentImageToExpenses < ActiveRecord::Migration[5.1]
  def self.up
    change_table :expenses do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :expenses, :image
  end
end
