class Room < ApplicationRecord
  has_many_attached :images
  has_one_attached :main_image

  has_many :users
  has_many :reservations, dependent: :destroy

  def default_main_image
    main_image.attached? ? main_image : "nanasqa-"+ [1,2,3,4].sample.to_s + ".jpg"
  end

  def is_available?(start_date:, end_date:)
    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)
    !(Room.eager_load(:reservations).where("reservations.start_date >= ? AND reservations.end_date <= ? AND rooms.id = ?", start_date, end_date, self.id).any?)
  end

  def unavailables_dates
    Reservation.where(room_id: self.id).select("start_date", "end_date").map{|e| [e.start_date.strftime("%d-%m-%Y"), e.end_date.strftime("%d-%m-%Y")]}
  end
end
