class MessagesController < ApplicationController
  def create
    @chat = current_user.chats.find(params[:chat_id])
    @chat.ask(message_params[:content])
    redirect_to chat_path(@chat)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
