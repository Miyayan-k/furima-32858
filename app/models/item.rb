class Item < ApplicationRecord

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of [:price], with: PRICE_REGEX, message: 'は半角数字のみ使用できます'

  with_options presence: true do
    validates :title
    validates :description
    validates :category_id
    validates :state_id
    validates :shipping_id
    validates :consignor_area_id
    validates :days_id
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999}
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
