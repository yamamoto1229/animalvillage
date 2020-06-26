class ClipsController < ApplicationController


	def index
	    @user = current_user
	    @clips = Clip.where(user_id: @user.id).all
	end

	def list
	    @animal = Animal.find(params[:id])
	    @clips = Clip.where(animal_id: @animal.id).all
	end

	def create
		@user = current_user
		@animal = Animal.find(params[:id])
		@clip = Clip.new(animal_id: @animal, user_id: @user)

		if @clip.save
			redirect_to user_path(current_user)
		else
			redirect_to clips_path(current_user)
		end
	end

	def destroy
		@clip = Clip.find(params[:id])
		if @clip.destroy
			redirect_to user_path(current_user)
		end
	end
end
