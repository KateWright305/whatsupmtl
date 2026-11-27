class Message < ApplicationRecord
  acts_as_message

  after_create_commit :broadcast_message

  private

  def broadcast_message
    return if content.blank?

    broadcast_append_to chat, target: "messages", partial: "messages/message", locals: { message: self }
  end
end
