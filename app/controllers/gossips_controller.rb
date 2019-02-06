class GossipsController < ApplicationController

    def index
        # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
        @gossips = Gossip.all
    end
    
      def show
        # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
        @id=params[:id]
        @gossip_detail=Gossip.find(@id)
        @author_id = @gossip_detail.user.id 
        @city_id = @gossip_detail.user.city.id 
    end
    
      def new
        # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
     
    end
    
      def create
        # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
        # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)

      end
    
      def edit
        # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
      
        @id=params[:id]
        @gossip_detail=Gossip.find(@id)
        @author_id = @gossip_detail.user.id 
        @city_id = @gossip_detail.user.city.id 
      end
    
      def update
        # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params
        # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
        @id=params[:id]
        @gossip = Gossip.find(@id)

       if @gossip.update(title: params[:gossip_title], content: params[:gossip_content])
          redirect_to gossip_path(@id)
        else
          render :edit
        end

      end

      
    
      def destroy
        # Méthode qui récupère le potin concerné et le détruit en base
        # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
      end



end

