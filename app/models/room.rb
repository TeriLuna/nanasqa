class Room < ApplicationRecord
  has_many_attached :images
  has_one_attached :main_image

  has_many :users
  has_many :reservations, dependent: :destroy

  def default_main_image
    main_image.attached? ? main_image : "nanasqa-"+ [1,2,3,4].sample.to_s + ".jpg"
  end
end
