class PurchasesController < ApplicationController
  before_action :find_item, only: [:index, :create]
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def find_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(
      :post_number, :prefecture_id, :city, :street_number, :building,
      :tel, :item_id).merge(user_id: current_user.id)
  end
end
