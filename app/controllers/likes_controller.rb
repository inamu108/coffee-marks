class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, shop_id: @shop.id)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, shop_id: @shop.id)
    @like.destroy
  end

  private
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

end
