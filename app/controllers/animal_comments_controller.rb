class AnimalCommentsController < ApplicationController
	def create
	    animal = Animal.find(params[:animal_id])
	    comment = current_user.animal_comments.new(animal_comment_params)
	    comment.animal_id = animal.id
	    #comment = animal.animal_comments.new(animal_comment_params)
	    #comment.user_id = current_user.id
	    #binding.pry
	    comment.save!
	    redirect_to animal_path(animal)
	end

	def destroy
		binding.pry
	    AnimalComment.find_by(id: params[:id], animal_id: params[:animal_id]).destroy
	    redirect_to animal_path(params[:animal_id])
    end
    def edit
	  	#@animal = AnimalComm.find(params[:id])
	  	#if current_user.id != @animal.user_id
	      #redirect_to animals_path
	    #end
    end

	private
	def animal_comment_params
	    params.require(:animal_comment).permit(:comment)
	end
end
