class LanguagesController < ApplicationController
  def update
    redirect_to session.delete(:return_to)
  end
end
