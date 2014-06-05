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

  private
  def pet_params
    params.require(:pet).permit(:pet_name, :owner)
  end
end