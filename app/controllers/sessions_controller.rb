class SessionsController < ApplicationController

	def new
	end
	
	def create
	user = User.find_by(email: params[:session][:email].downcase)
	    if user && user.authenticate(params[:session][:password])
	      log_in user
	      remember user
	      flash[:success] = "Authentification Success. Welcome back #{user.first_name}"
	      redirect_to gossips_path

	      
	    else
	      flash.now[:error] = 'Invalid email/password combination'
	      render 'new'
	    end
	end


  	def destroy
  		log_out
  		session.delete(:user_id)
  		redirect_to new_session_path
  	end
 
end
