class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :mypage]
  
  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
    else
      render :edit
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
