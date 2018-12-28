class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :users, foreign_key: true
      t.integer :contact_no

      t.timestamps
    end
  end
end
