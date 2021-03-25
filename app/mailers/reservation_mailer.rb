class ReservationMailer < ApplicationMailer
  def reservation
    @user = params[:user]
    @reservation = params[:reservation]
    mail(to: ENV['ADMIN_EMAIL'], subject: 'New Reservation')
  end
end
