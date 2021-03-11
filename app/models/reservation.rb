class Reservation < ApplicationRecord
  enum status: { created: 0, failed: 1, approved: 2 }

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :end_date_is_after_start_date

  belongs_to :room
  belongs_to :user

  has_many :comments, as: :commentable

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    end
  end

  def number_or_nigths
    (self.end_date.to_date - self.start_date.to_date).to_i
  end

end
