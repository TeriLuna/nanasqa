class UsersController < ApplicationController
  layout "volunteers"
  before_action :authenticate_user!

  def index
    @user = current_user
    @reservations = Reservation.where(user_id: User.first).includes(:room)
  end

  def update_password
    @user = current_user
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
    end
    if @user.update(user_params)
      # Sign in the user by passing validation in casReservation.where(user_id: User.first).includes(:room)e their password changed
      bypass_sign_in(@user, scope: :user)
      flash[:notice] = t('login.user_updated')
      redirect_to user_path(current_user)
    else
      flash[:alert] = t('login.user_not_updated')
      redirect_to user_path(current_user)
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).
           permit(
            :email,
            :password,
            :password_confirmation,
            :first_name,
            :last_name,
            :contry,
            :time_zone
          )
  end
end
