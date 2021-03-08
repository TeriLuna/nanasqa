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
end
