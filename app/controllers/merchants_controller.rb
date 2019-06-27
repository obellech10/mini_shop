class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchants = Merchant.find(params[:id])
  end

  def new
  end

  def create
    @merchant = Merchant.create(merchant_params)
    redirect_to '/merchants'
  end

  private

  def merchant_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
