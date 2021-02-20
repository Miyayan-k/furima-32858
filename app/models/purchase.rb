class Purchase < ApplicationRecord
  has_one    :addresse
  belongs_to :item
  belongs_to :user
end
