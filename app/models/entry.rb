class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :category
  scope :income, -> {where(type: 'income')}
  scope :expense, -> {where(type: 'expense')}
end
