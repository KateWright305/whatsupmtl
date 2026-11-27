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

      User preferences:
      You have access to a UserPreferencesTool.
      Use this tool when the user's preferences can help personalize your answer.
      If no preferences are available, provide general recommendations.

      Format:
      You have access to a tool that returns activities in a structured format,
      but always convert raw timestamps into human-readable dates and times before
      displaying them to the user.
      Use this to return results.
      Keep your conversational responses clear, friendly and concise.

      When the user wants to add a suggested activity to their calendar, it will
      get saved in the database. Therefore it must have a date and time. If the
      activity doesn't have a set date/time then make a suggestion in the format
      and let the user know that you are making a suggestion.
      Suggest three activities at a time.
  PROMPT

  def create
    @chat = current_user.chats.find(params[:chat_id])
    @chat.with_instructions(SYSTEM_PROMPT)
    @chat.with_provider_tools(:web_search)
    @chat.with_tools(CreateActivityTool)
    @chat.with_tools(
      UserPreferencesTool.new(user: current_user)
    )

    @chat.ask(message_params[:content])
    if turbo_frame_request?
      render partial: "messages/form", locals: { chat: @chat, message: Message.new }
    else
      redirect_to chat_path(@chat)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
