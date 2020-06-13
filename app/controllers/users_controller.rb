class UsersController < ApplicationController
	before_action :baria_user, only: [:update]

  def index #会員一覧表示
  	@users = User.all
  	@user = User.find(current_user[:id])
  end

  def show  #マイページ表示
  	@user = User.find(params[:id])
  end

  def new
  end

  def edit
  	@user = User.find(params[:id])
  	if current_user.id != @user.id
       redirect_to user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user), notice: "successfully updated user!"
  	else
  		render "edit"
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction)
  end
end
