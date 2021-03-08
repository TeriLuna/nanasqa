class AddRoomIdToUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :room_id, :integer
  end
end
