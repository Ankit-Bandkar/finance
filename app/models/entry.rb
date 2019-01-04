class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :category
  scope :income, -> {where(type: 'income')}
  scope :expense, -> {where(type: 'expense')}

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |entry|
        csv << entry.attributes.values_at(*column_names)
      end
    end
  end
end
