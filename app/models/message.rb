class Message < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user, optional: true
end
