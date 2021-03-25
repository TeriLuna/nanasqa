class Volunteer < ApplicationRecord
  #enum gender: { male: 0, female: 1, other: 2 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :country_code, presence: true
  validates :skills, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :trip_purpose, presence: true
  validates :how_can_you_help , presence: true
end
