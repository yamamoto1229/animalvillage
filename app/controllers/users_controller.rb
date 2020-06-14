class UsersController < ApplicationController
	before_action :baria_user, only: [:update]
  def index
  	@users = User.all
  	@animal = Animal.new
  end

  def show
  	@user = User.find(params[:id])
  	@animals = @user.animals
  	@animal = Animal.new
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user), notice: "successfully updated user!"
  	else
  		render "edit"
  	end
  end

  def edit
  	@user = User.find(params[:id])
  	if current_user.id != @user.id
      redirect_to user_path(current_user)
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
