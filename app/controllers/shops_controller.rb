class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :search]

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
  end

  def update
    @shop.update(shop_params)
  end

  def destroy
    @shop.destroy
  end

  private

  def shop_params
    params.require(:shop).permit(:image, :name, :evaluation, :prefecture_code, :station, :move, :time, :description).merge(user_id: current_user.id)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
