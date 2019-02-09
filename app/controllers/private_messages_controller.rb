class PrivateMessagesController < ApplicationController
include PrivateMessagesHelper
before_action :authenticate_user, only: [:new, :edit, :update, :create, :destroy]

  def create

    @sender=current_user
    @content=params[:private_message][:content]
    @receiver=User.find_by_email(params[:private_message][:receiver].downcase)
    @messages=PrivateMessage.all 

   

    @messages.each do |pm|
      if pm.sender == @sender

        puts "le sender a déjà envoyé un message"

        if pm.receiver=@receiver
          puts "le receiver était le même, il s'agit de la même conversation"
          @conversation=pm.conversation
        end

      elsif pm.receiver==@sender
        
        puts "le sender a déjà recu un message"
        
        if pm.sender==@receiver
          puts "le sender était le destinataire de son message, il s'agit de la même conversation"
          puts "je récupère l'id de la conversation"
           @conversation=pm.conversation
        end

      else 
      puts "il s'agit d'une nouvelle conversation, je crée une nouvelle conversation"
      @conversation=Conversation.create
      
      end
    end

    if @conversation.nil? 
      @conversation=Conversation.create
    end



    @private_message = PrivateMessage.create(sender: @sender, content: @content, receiver: @receiver, conversation: @conversation) 
   
    if @private_message.save
      flash[:success] = "Message bien envoyé"
      redirect_to private_messages_path
    else
       flash[:error] = "Wrong receiver. Did you mean #{User.all.sample.email} ?"
       redirect_to new_private_message_path
    end


  end



  def new
  end

  def edit
  end

  def show
  end

  def index
    @private_messages=PrivateMessage.all

    @received_messages=PrivateMessage.where(receiver: current_user)
    @sent_messages=PrivateMessage.where(sender: current_user)

   
  end

  def destroy
    PrivateMessage.find_by(id:params[:id]).delete
    flash[:success] = "Message deleted"
    redirect_to private_messages_path
  end



  private

  def authenticate_user
    unless current_user
      flash[:error] = "Please log in."
      redirect_to new_session_path
    end
  end

end
