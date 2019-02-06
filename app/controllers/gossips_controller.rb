class GossipsController < ApplicationController

    def index
        # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
        @gossips = Gossip.all.order("created_at ASC")

    end
    
      def show
        # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage


        @gossip=Gossip.find(params[:id])

        @author_id = @gossip.user.id 

        @comments=@gossip.comments.order("created_at ASC")
        
        @city_id=@gossip.user.city

    end
    
      def new
        # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
     
    end
    
      def create
        # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
        # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
         @gossip = Gossip.new(title: params["gossip_title"], content: params["gossip_content"] , user: User.all.sample)  


       if @gossip.save # essaie de sauvegarder en base @gossip
        flash[:success] = "Well done MF"
        redirect_to gossips_path
        
       else
       # render new_gossip_path
       flash[:error] = "Remplis moi ce formulaire Feignasse"
       render 'new'
      
      end

    end
    
      def edit
        # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
        @gossip=Gossip.find(params[:id])
     
      end
    
      def update
        @gossip=Gossip.find(params[:id])
        post_params= params.require(:gossip).permit(:title, :content)
        if @gossip.update(post_params) 
          flash[:success] = "Well done Nini"
          redirect_to gossips_path
      
        else
          flash[:error] = "Remplis moi ce formulaire Feignasse"
          render 'edit'
        end


      end

      
    
      def destroy
        # Méthode qui récupère le potin concerné et le détruit en base
        # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
       @gossip=Gossip.find(params[:id])
      @gossip.destroy
      redirect_to gossips_path
      end



end

