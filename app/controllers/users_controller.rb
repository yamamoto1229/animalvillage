class UsersController < ApplicationController
  def index
  	@users = User.all
  	@animal = Animal.new
    @clips = Clip.where(animal_id: @animal.id).all
  end

  def show
  	@user = User.find(params[:id])
  	
  	@animal = Animal.new
    @animals = Animal.where(user_id: @user.id)
    @clips = Clip.where(animal_id: @animal.id).all
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
