class Item < ApplicationRecord

  # PRICE_REGEX = /\A[0-9]+\z/.freeze
  # validates_format_of [:price], with: PRICE_REGEX, message: 'は半角数字のみ使用できます'

  with_options presence: true do
    validates :title
    validates :description
    validates :price, numericality: { 
      greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999
    }
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :state_id
    validates :shipping_id
    validates :consignor_area_id
    validates :days_id
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :days
  belongs_to :consignor_area
  belongs_to :shipping
  belongs_to :state
  belongs_to :category
end
