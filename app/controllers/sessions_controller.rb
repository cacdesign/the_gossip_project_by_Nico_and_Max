class SessionsController < ApplicationController
  def new

  	#@session=Session.new
  end

  def create
  	  puts post_params= params.require(:session).permit(:email, :password)

	  # cherche s'il existe un utilisateur en base avec l’e-mail
	  user = User.find_by(email: post_params[:email])


	  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
	  if user 

	  	if user.authenticate(	post_params[:password])
		session[:user_id] = user.id
	    # redirige où tu veux, avec un flash ou pas
	     flash[:success] = "Authentification Success. Welcome back #{user.first_name}"
	    redirect_to gossips_path

	  	else

	    flash.now[:error] = "Mot de pass erroné"
	    render 'new'
	  	end

	  else
	  	flash.now[:error] = "Inscrivez-vous d'abord"
	    render new_author_path
	  end

  end

  def destroy
  end
end
