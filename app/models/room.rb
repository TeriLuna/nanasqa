class Room < ApplicationRecord
  has_many_attached :images
  has_one_attached :main_image

  has_many :users
  has_many :reservations, dependent: :destroy

  def default_main_image
    main_image.attached? ? main_image : "nanasqa-"+ [1,2,3,4].sample.to_s + ".jpg"
  end

  def is_available?
    joins(:reservations)
    #
  end
  def is_available?(start_date:, end_date:)
    Room.eager_load(:reservations).where("reservations.start_date <= ? AND reservations.end_date <= ? AND rooms.id = ?", start_date, end_date, self.id).any?
  end
end
