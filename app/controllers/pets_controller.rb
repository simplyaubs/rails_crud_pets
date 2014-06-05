class PetsController < ApplicationController

  def index
    @pet = Pet.new
    @pets = Pet.all
  end

  def create
    @pet = Pet.create(pet_params)
    if @pet.save
      redirect_to pets_path
    else
      render :index
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update_attributes!(pet_params)

    redirect_to pets_path
  end

  def destroy
    @pet = Pet.find(params[:id]).delete

    redirect_to pets_path
  end

  private
  def pet_params
    params.require(:pet).permit(:pet_name, :owner)
  end
end