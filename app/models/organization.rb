class Organization < ApplicationRecord
    has_many :users
    has_many :contacts, as: :contactable, dependent: :destroy
    accepts_nested_attributes_for :contacts, allow_destroy: true
end
