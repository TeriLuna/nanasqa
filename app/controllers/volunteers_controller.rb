class VolunteersController < ApplicationController
  layout 'volunteers'

  def index
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.find_or_initialize_by(email: volunteer_params[:email])
    @volunteer.attributes = volunteer_params
    @volunteer.additional_info = additional_info_params[:additional_info]

    if @volunteer.save
      flash.now[:notice] = t("volunteer.application_sent_successfuly")
      render :new
    else
      flash.now[:alert] = t("volunteer.application_sent_error")
      render :new
    end
  end

  private
  def volunteer_params
    params.require(:volunteer).permit(
      :first_name,
      :last_name,
      :email,
      :country_code,
      :phone_number,
      :gender,
      :skills,
      :start_date,
      :end_date,
      :trip_purpose,
      :how_can_you_help,
      :questions
    )
  end

  def additional_info_params
    params.permit(additional_info: {})
  end
end
