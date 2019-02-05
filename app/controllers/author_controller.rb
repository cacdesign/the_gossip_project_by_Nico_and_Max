class AuthorController < ApplicationController
    
    def show
        @id=params[:id]
        @author=User.find(@id)
    end
end
