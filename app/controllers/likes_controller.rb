class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = Like.new
    like.user_id = current_user.id
    like.shop_id = params[:shop_id]

    if like.save
      redirect_to root_path, success: 'お気に入りに登録しました！'
    else
      redirect_to root_path, danger: 'お気に入り登録に失敗しました。'
    end
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, shop_id: params[:shop_id])
    like.destroy if like.present?

    if like.destroyed?
      redirect_to root_path, success: 'お気に入りを解除しました'
    else
      redirect_to root_path, success: 'お気に入り解除に失敗しました'
    end
  end

end
