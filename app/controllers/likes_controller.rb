class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like

  def create
    user = current_user
    shop = Shop.find(params[:shop_id])
    like = Like.create(user_id: user.id, shop_id: shop.id)
  end
  def destroy
    user = current_user
    shop = Shop.find(params[:shop_id])
    like = Like.find_by(user_id: user.id, shop_id: shop.id)
    like.delete
  end

  private

  def set_like
    @shop = Shop.find(params[:shop_id])
  end

end
