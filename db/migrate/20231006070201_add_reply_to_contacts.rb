class AddReplyToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :reply, :text
  end
end
