class ChatsController < ApplicationController
  def index
    @chats = current_user.chats
    @chat = Chat.new
  end

  def show
    @chat = current_user.chats.find(params[:id])
    @message = Message.new
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new
    @chat.user = current_user
    if @chat.save
      redirect_to chat_path(@chat)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
