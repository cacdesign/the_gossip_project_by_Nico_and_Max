class LikesController < ApplicationController
	    before_action :authenticate_user, only: [:new, :create, :destroy]


	def index
	end

	def new
	end

	def create
		@gossip = Gossip.find(params["gossip_id"])
		@user = @gossip.user
		@like = Like.create(user: @user, gossip: @gossip)
		flash[:success] = "Vous avez bien ajouté votre like"
		redirect_to request.referrer
	end

	def edit
	end

	def update
	end

	def destroy
		@like = Like.find(params[:id])
		@like.delete
		flash[:error] = "Vous avez bien supprimé votre like"
		redirect_to request.referrer
	end



private

	def authenticate_user
	    unless current_user
	      flash[:error] = "Please log in."
	      redirect_to new_session_path
	    end
  	end

end
