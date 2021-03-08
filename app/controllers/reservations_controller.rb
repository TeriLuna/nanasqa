class ReservationsController < ApplicationController
  #layout "volunteers"
  def index
    @rooms = Room.all
  end

  def new
    @user = current_user
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end

  def create
    @room = Room.where(id: reservation_params[:room_id]).first
    if @room.present?
      @reservation = Reservation.
        first_or_initialize(user_id: current_user.id, room_id: @room.id)

      @reservation.attributes = reservation_params

      if @reservation.save
        redirect_to users_path
      else
        flash.now[:error] = @reservation.errors.full_messages.to_sentence
        render :new
      end
    end
  end

  private
  def reservation_params
    params.require(:reservation).
      permit(:room_id, :user_id, :start_date, :end_date, :message)
  end
end
