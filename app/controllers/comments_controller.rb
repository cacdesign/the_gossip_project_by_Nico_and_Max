class CommentsController < ApplicationController
  def show

    
  end



  def edit
  	@gossip = Gossip.find(params["gossip_id"])
  	@comment = @gossip.comments.find(params[:id])
  end

  def new

  end

  def create
  	puts params
  	@gossip = Gossip.find(params["gossip_id"])
  	@user = @gossip.user
  	

  	@comment = Comment.new(content: params["comment"], user: @user , gossip: @gossip)  


       if @comment.save # essaie de sauvegarder en base @gossip
        flash[:success] = "Well done MF"
        redirect_to gossip_path(@gossip)
        
       else
       # render new_gossip_path
       flash[:error] = "Remplis moi ce formulaire Feignasse"
       redirect_to gossip_path(@gossip)
      
      end

  end

  def index
  end

  def update

  	    @gossip=Gossip.find(params["gossip_id"])
  	    @comment=@gossip.comments.find(params[:id])
         post_params= params.require(:comment).permit(:content)
        if @comment.update(post_params) 
          flash[:success] = "Well done Nini"
          redirect_to gossips_path
      
        else
          flash[:error] = "Remplis moi ce formulaire Feignasse"
          render 'edit'
        end
  end
end
