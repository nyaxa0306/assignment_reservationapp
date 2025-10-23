class UsersController < ApplicationController
  before_action :authenticate_user!

  def account
  end
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(current_user_params)
      flash[:notice] = "プロフィールを更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
    end
    redirect_to account_path
  end

  private
  def current_user_params
    params.require(:user).permit(:name, :introduction, :avatar)
  end
end
