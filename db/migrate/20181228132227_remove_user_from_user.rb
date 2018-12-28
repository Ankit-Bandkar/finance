class RemoveUserFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :users_id, :integer
  end
end
