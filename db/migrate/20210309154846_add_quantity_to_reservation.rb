class AddQuantityToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :quantity, :integer, default: 1
    add_column :reservations, :total, :integer, default: 0
  end
end
