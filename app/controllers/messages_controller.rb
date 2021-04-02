class MessagesController < ApplicationController

  def create
    reservation_id = params[:message].delete(:reservation_id)
    reservation = current_user.reservations.find(reservation_id)
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast "chat_#{current_user.id}_#{reservation.room.id}",
        message: message.content,
        user: message.user.username
      head :ok
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :chat_room_id)
    end
end
