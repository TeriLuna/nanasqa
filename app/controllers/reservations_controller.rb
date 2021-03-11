class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :success, :edit, :show]

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
    @preference_id = generate_mercado_pago_preference(@reservation)
  end

  def create
    @room = Room.where(id: reservation_params[:room_id]).first
    if @room.present?
      if @room.is_available?(start_date: reservation_params[:start_date], end_date: reservation_params[:end_date])
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
      else
        @reservation = Reservation.new(reservation_params)
        flash.now[:alert] = "Room not available in these dates"
        render :new
      end
    end
  end

  def success
    @reservation = Reservation.where(user_id: current_user.id, id: params[:reservation_id]).first
    @reservation.status = :approved
    if @reservation.additional_info.present?
      @reservation.additional_info["#{@reservation.additional_info.keys.size + 1}"] = params
    else
      @reservation.additional_info = {"1" => params}
    end
    @reservation.save
  end

  def failure
    @reservation = Reservation.where(user_id: current_user.id, id: params[:reservation_id]).first
    @reservation.status = :failed
    if @reservation.additional_info.present?
      @reservation.additional_info["#{@reservation.additional_info.keys.size + 1}"] = params
    else
      @reservation.additional_info = {"1" => params}
    end
    @reservation.save
  end

  private
  def reservation_params
    params.require(:reservation).
      permit(:room_id, :user_id, :start_date, :end_date, :message, :quantity)
  end

  def additional_info_params
    params.permit!(:collection_id, :collection_status, :payment_id, :status,
                   :external_reference, :payment_type, :merchant_order_id,
                   :preference_id, :site_id, :processing_mode,
                   :merchant_account_id)

  end

  def calculate_total(room, reservation)
    number_of_nigths = reservation.number_or_nigths
    per_person  = room.price_per_person
    quantity    = reservation.quantity
    (per_person * quantity * number_of_nigths)
  end

  def generate_mercado_pago_preference(reservation)
    preference_data = {
      "items": [
        {
          "title": reservation.room.name,
          "unit_price": (reservation.room.price_per_person.to_f * reservation.number_or_nigths),
          "quantity": reservation.quantity
        }
      ],
      "back_urls": {
        "success": ENV['HOST_DOMAIN'] + reservation_success_path(reservation_id: reservation.id),
        "failure": ENV['HOST_DOMAIN'] + reservation_failure_path(reservation_id: reservation.id),
        "pending": ENV['HOST_DOMAIN'] + reservation_pending_path(reservation_id: reservation.id)
      }
    }

    preference = $mercado_pago.create_preference(preference_data)

    # Este valor reemplazará el string "<%= @preference_id %>" en tu HTML
    preference["response"]["id"]
  end
end
