class ItemsController < ApplicationController
  def index
  end

  private
  def item_parameter
    params.require(:item).permit(
      :title, :description, :category_id, :state_id, :shipping_id, 
      :consignor_area_id, :days_id, :price, :image
    )
  end
end
