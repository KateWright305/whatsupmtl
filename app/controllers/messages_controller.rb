class MessagesController < ApplicationController
  SYSTEM_PROMPT = <<~PROMPT
    Persona:
      You are a helpful activity assistant. You help people discover activities,
      events and places in Montreal.

      Goal:
      Your goal is to recommend relevant activities based on the user's interests,
      preferences, location and budget.

      Context:
      You are part of this application which designed to help people discover
      activities in Montreal.
      Use the web search tool to find activities based on user input.

      Format:
      You have access to a tool that returns activities in a structured format.
      Use this to return results
      Keep your conversational responses clear, friendly and concise.
  PROMPT

  def create
    @chat = current_user.chats.find(params[:chat_id])
    @chat.with_instructions(SYSTEM_PROMPT)
    @chat.with_provider_tools(:web_search)
    @chat.with_tools(CreateActivityTool)
    @chat.ask(message_params[:content])
    redirect_to chat_path(@chat)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
