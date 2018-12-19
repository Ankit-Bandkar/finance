class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :amount
      t.references :category, foreign_key: true
      t.string :description
      t.datetime :entry_date
      t.belongs_to :user
      t.string :type

      t.timestamps
    end
  end
end
