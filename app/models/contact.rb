class Contact < ApplicationRecord
  belongs_to :users, optional: true
end
