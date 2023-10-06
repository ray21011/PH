class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :customer_id, null: falseco
      t.timestamps
    end
  end
end
