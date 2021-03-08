class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.text :description
      t.integer :max_people
      t.decimal :price_per_person
      t.integer :number_of_beds

      t.timestamps
    end
  end
end
