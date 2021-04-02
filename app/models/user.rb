class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :room, optional: true

  has_many :reservations, dependent: :destroy
  has_many :messages
  has_many :chatrooms, through: :messages

  def username
    self.email.split("@")[0]
  end
end
