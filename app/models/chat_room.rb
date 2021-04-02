class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  accepts_nested_attributes_for :messages
end
