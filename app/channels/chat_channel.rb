class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:chatroom]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
