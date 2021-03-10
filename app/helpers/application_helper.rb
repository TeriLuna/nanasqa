module ApplicationHelper

  def pay_buttom_text(reservation:, show_total: true)
    if reservation.total.present? && params[:action] == "show"
      text = "Pay $#{reservation.total}"
    else
      per_person  = reservation&.room&.price_per_person || 0
      quantity    = reservation.quantity
      total       = reservation.quantity * per_person

      show_total_text = (show_total ? "$#{total}" : "_total_")
      text = "#{t('reservations.save')} | Pay $#{show_total_text}"
    end
    text
  end
end
