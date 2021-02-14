class ItemsController < ApplicationController
  # before_action :authenticate_user!

  def index
  end

  def new
    
  end

  private
  def item_parameter
    params.require(:item).permit(
      :title, :description, :category_id, :state_id, :shipping_id, 
      :consignor_area_id, :days_id, :price, :image
    )
  end
end
