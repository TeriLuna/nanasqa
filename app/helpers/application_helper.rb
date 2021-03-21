module ApplicationHelper

  def pay_buttom_text(reservation:, show_total: true, show_text: true, room: nil)
    if show_text == false
      if reservation.total.present? && params[:action] == "show"
        text = "$#{reservation.total}"
      else
        per_person  = reservation&.room&.price_per_person || room.price_per_person
        quantity    = reservation.quantity
        total       = reservation.quantity * per_person

        show_total_text = (show_total ? "$#{total}" : "_total_")
        text = "Pay #{show_total_text}"
      end
    else
      if reservation.total.present? && params[:action] == "show"
        text = "Pay $#{reservation.total}"
      else
        per_person  = reservation&.room&.price_per_person || room.price_per_person
        quantity    = reservation.quantity
        total       = reservation.quantity * per_person

        show_total_text = (show_total ? "$#{total}" : "_total_")
        text = "#{t('reservations.save')} | Pay #{show_total_text}"
      end
    end
    text
  end
end
