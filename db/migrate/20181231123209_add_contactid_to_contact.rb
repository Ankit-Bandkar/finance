class AddContactidToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :contactable_id, :integer
    add_column :contacts, :contactable_type, :string
  end
  add_index :contacts, [:contactable_id, :contactable_type]
end
