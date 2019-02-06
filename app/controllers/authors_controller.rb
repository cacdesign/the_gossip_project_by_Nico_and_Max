class AuthorsController < ApplicationController
  def show
    @id=params[:id]
    @author=User.find(@id)
    @city_id = @author.city.id
end
end
