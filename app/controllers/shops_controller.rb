class ShopsController < ApplicationController
  before_action :set_shop, only: [:show]

  def index
    @shops = Shop.includes(:user).limit(6).order('created_at DESC')
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

  def show
  end

  def list
    @shops = Shop.includes(:user).order('created_at DESC')
  end

  private

  def shop_params
    params.require(:shop).permit(:image, :name, :evaluation, :prefecture_code, :station, :move, :time, :description).merge(user_id: current_user.id)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
