class Address < ApplicationRecord
  with_options presence: true do
    validates :post_number
    validates :city
    validates :street_number
    validates :tel
  end

  validates :prefecture_id, numericality: { other_than: 0 }

  belongs_to :purchase
end
