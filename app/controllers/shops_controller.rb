class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    @shops = Shop.includes(:user).limit(6).order('created_at DESC')
    @ranking_likes = Shop.find(Like.group(:shop_id).order('count(shop_id) desc').limit(5).pluck(:shop_id))
    @ranking_users = User.where(id: Shop.group(:user_id).order('count(user_id) desc').limit(5).pluck(:user_id))
  end

  def new
    if user_signed_in?
      @shop = Shop.new
    else
      redirect_to new_user_session_path, alert: "ログインして下さい"
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
    @comment = Comment.new
    @comments = @shop.comments.includes(:user)
  end

  def list
    @shops = Shop.includes(:user).order('created_at DESC').page(params[:page]).per(9)
  end

  def search
    @shops = Shop.search(params[:keyword]).order('created_at DESC').page(params[:page]).per(9)
  end

  def edit
    if user_signed_in? && current_user.id == @shop.user_id
    else
      redirect_to new_user_session_path, alert: 'ログインして下さい'
    end
  end

  def update
    if user_signed_in? && current_user.id == @shop.user_id
      @shop.update(shop_params)
    else
      redirect_to new_user_session_path, alert: 'ログインして下さい'
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @shop.user_id
      @shop.destroy
    else
      redirect_to new_user_session_path, alert: 'ログインして下さい'
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:image, :name, :evaluation, :station, :move, :time, :description).merge(user_id: current_user.id)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end
