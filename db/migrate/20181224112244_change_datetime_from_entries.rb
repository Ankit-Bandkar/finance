class ChangeDatetimeFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :entry_date, :datetime
    add_column :entries, :entry_date, :date
  end
end
