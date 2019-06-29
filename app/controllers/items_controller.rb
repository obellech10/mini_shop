class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @items = Merchant.find(params[:merchant_id]).items
  end
end
