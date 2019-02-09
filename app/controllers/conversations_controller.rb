class ConversationsController < ApplicationController
  def new
  end

  def create


  end

  def index

  end

  def destroy
  end

  def show
  @id=params[:id]
  @messages_conversation=PrivateMessage.where(conversation: @id).order('created_at ASC')
  puts @messages_conversation

  end
end
