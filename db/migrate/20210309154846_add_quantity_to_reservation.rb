class AddQuantityToReservation < ActiveRecord::Migration[5.2]
  def up
    add_column :reservations, :quantity, :integer, default: 1
    add_column :reservations, :total, :decimal, default: 0
    add_column :reservations, :additional_info, :jsonb, default: {}
  end

  def down
    remove_column :reservations, :quantity
    remove_column :reservations, :total
    remove_column :reservations, :additional_info
    remove_column :reservations, :total
  end
end
