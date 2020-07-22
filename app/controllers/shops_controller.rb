class ShopsController < ApplicationController
  def index
    # @shops = Shop.all
  end

  def new
    if user_signed_in?
      @shop = Shop.new
    else
      redirect_to new_user_session_path, info: "ログインして下さい"
    end
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
    else
      render :new
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:image, :name, :evaluation, :prefecture_code, :station, :description).merge(user_id: current_user.id)
  end
end
