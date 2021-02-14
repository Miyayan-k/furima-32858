class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :title, :description, :category_id, :state_id, 
      :shipping_id, :consignor_area_id, :days_id, :price, :image
    )
  end
end
