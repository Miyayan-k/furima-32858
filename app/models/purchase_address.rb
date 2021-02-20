class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :street_number,
                :building, :tel, :user_id, :item_id

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはハイフンを入れてください。"}
    validates :city
    validates :street_number
    validates :tel
  end
  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    item = Item.find(params[:id])
    user = item.user
    purchase = Purchase.create(user_id: user.id, item_id: item.id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city,
    street_number: street_number, tel: tel, purchase_id: purchase.id)
  end
end