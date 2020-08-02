class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :mypage]
  
  def show
  end

  def edit
    unless @user == current_user
      redirect_to mypage_user_path(@user)
    end
  end

  def update
    if current_user.update(user_params)
       redirect_to mypage_user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def mypage
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :family_name, :first_name)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
