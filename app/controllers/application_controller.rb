class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	before_action :configure_permitted_parameters, if: :devise_controller?
	def search
		if params[:search_type] == "animal"
	  	    @animals = Animal.search(params[:search])
		    @animal = Animal.new
	  	    @user = current_user
	  	    render 'animals/index'
	    elsif params[:search_type] == "user"
        	@users = User.search(params[:search])
	        @animal = Animal.new
	        render 'users/index'
	    else
	        redirect_to root_path
	    end
	    # like  aimai kensaku rails
	    #@animals = Animal.where([:search])
	    #@animal = Animal.new
  	    #@user = current_user
  	    #render 'animals/index'
	end

protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end

end
