class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :phone_number, null: false, default: ""
      t.integer :gender
      t.text :skills, null: false, default: ""
      t.jsonb :additional_info, default: {}
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.text :trip_purpose, null: false, default: ""
      t.text :how_can_you_help, null: false, default: ""
      t.text :questions, null: false, default: ""
      t.string :country_code, default: ""

      t.timestamps
    end
  end
end
