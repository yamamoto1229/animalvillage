class AnimalsController < ApplicationController

  def index
  	@animals = Animal.all
  	@animal = Animal.new
  	@user = current_user
  end

  def show
    @newanimal = Animal.new
  	@animal = Animal.find(params[:id])
    @user = @animal.user
  end

  def new
    @animal = Animal.new
    @user = @animal.user
  end

  def create
  	@animal = Animal.new(animal_params)
  	@animal.user_id = current_user.id
  	if @animal.save #入力されたデータをdbに保存。
  		redirect_to @animal, notice: "successfully created animal!"#保存された場合の移動先を指定。
  	else
      @user = current_user
  	  @animals = Animal.all
  	  render :index
  	end
  end

  def edit
  	@animal = Animal.find(params[:id])
  	if current_user.id != @animal.user_id
      redirect_to animals_path
    end
  end

   def update
  	@animal = Animal.find(params[:id])
  	if @animal.update(animal_params)
  		redirect_to @animal, notice: "successfully updated animal!"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  		render "edit"
  	end
  end

  def destroy
  	@animal = Animal.find(params[:id])
  	@animal.destroy
  	redirect_to animals_path, notice: "successfully delete animal!"
  end
  private

  def animal_params
  	params.require(:animal).permit(:name, :body, :image)
  end
end
