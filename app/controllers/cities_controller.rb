class CitiesController < ApplicationController
  def show
<<<<<<< HEAD
  	@id = params[:id]
  	@city = City.find(@id)
=======
    @id = params[:id]
    @city = City.find(@id)
>>>>>>> f1f987d7ea30cca6676b8e8a587b10a0e8777ad0
  end
end
