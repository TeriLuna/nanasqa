class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id, null: false
      t.integer :room_id, null: false
      t.text :message
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false

      t.timestamps
    end
  end
end
