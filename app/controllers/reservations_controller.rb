class ReservationsController < ApplicationController
  layout "volunteers"
  def index
    @rooms = Room.all
  end

  def new
    @user = current_user
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end

  def edit
    @user = current_user
    # Is passing the user for segurity TODO: use cancancan
    @reservation = Reservation.where(user_id: current_user.id, id: params[:id]).includes(room: { images_attachments: :blob }).first

  end

  def show
    # Is passing the user for segurity TODO: use cancancan
    @reservation = Reservation.where(user_id: current_user.id, id: params[:id]).includes(room: { images_attachments: :blob }).first
  end

  def create
    @room = Room.where(id: reservation_params[:room_id]).first
    if @room.present?
      @reservation = Reservation.
        first_or_initialize(user_id: current_user.id, room_id: @room.id)

      @reservation.attributes = reservation_params
      @reservation.total = calculate_total(@room, @reservation)
      if @reservation.save
        redirect_to reservation_path(@reservation)
      else
        flash.now[:error] = @reservation.errors.full_messages.to_sentence
        render :new
      end
    end
  end

  private
  def reservation_params
    params.require(:reservation).
      permit(:room_id, :user_id, :start_date, :end_date, :message, :quantity)
  end

  def calculate_total(room, reservation)
    per_person  = room.price_per_person
    quantity    = reservation.quantity
    per_person * quantity
  end
end
