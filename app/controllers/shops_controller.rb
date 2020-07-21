class ShopsController < ApplicationController
  def index
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:image, :name, :evaluation, :prefecture_code, :station, :description)
  end
end
