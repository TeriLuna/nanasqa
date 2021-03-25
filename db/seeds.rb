# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if !AdminUser.any?
  AdminUser.create!(email: 'admin@nanasqa.com', password: 'Nanasqa!!', password_confirmation: 'Nanasqa!!') if Rails.env.development?
end

room_1 = Room.find_or_initialize_by(name: "Single Room")
room_1.attributes = {
  description: "All the rooms have private bathrooms, hot water 24hrs, wifi 5G.
                We have a community kitchen, living and rooftop available.
                Breakfast on request 10 and 15 soles, since 7am to 11am
                We follow all the covid protocols: Cleaning shoes before access, hand alcool on common areas, gun thermometer, finger oxygen meter.
                Our rooms can be shared only for the same family or arrival group.",
  max_people: 1,
  price_per_person: 40,
  number_of_beds: 1
}


room_2 = Room.find_or_initialize_by(name: "Double Room")
room_2.attributes = {
  description: "All the rooms have private bathrooms, hot water 24hrs, wifi 5G.
                We have a community kitchen, living and rooftop available.
                Breakfast on request 10 and 15 soles, since 7am to 11am
                We follow all the covid protocols: Cleaning shoes before access, hand alcool on common areas, gun thermometer, finger oxygen meter.
                Our rooms can be shared only for the same family or arrival group.",
  max_people: 2,
  price_per_person: 60,
  number_of_beds: 2,
}


room_3 = Room.find_or_initialize_by(name: "Couple Room")
room_3.attributes = {
  description: "All the rooms have private bathrooms, hot water 24hrs, wifi 5G.
                We have a community kitchen, living and rooftop available.
                Breakfast on request 10 and 15 soles, since 7am to 11am
                We follow all the covid protocols: Cleaning shoes before access, hand alcool on common areas, gun thermometer, finger oxygen meter.
                Our rooms can be shared only for the same family or arrival group.",
  max_people: 2,
  price_per_person: 60,
  number_of_beds: 2,
}

room_4 = Room.find_or_initialize_by(name: "Triple Room")
room_4.attributes = {
  description: "All the rooms have private bathrooms, hot water 24hrs, wifi 5G.
                We have a community kitchen, living and rooftop available.
                Breakfast on request 10 and 15 soles, since 7am to 11am
                We follow all the covid protocols: Cleaning shoes before access, hand alcool on common areas, gun thermometer, finger oxygen meter.
                Our rooms can be shared only for the same family or arrival group.",
  max_people: 3,
  price_per_person: 80,
  number_of_beds: 3,
}

room_5 = Room.find_or_initialize_by(name: "Quadruple Room")
room_5.attributes = {
  description: "Include 2 private bathrooms inside the room - All the rooms have private bathrooms, hot water 24hrs, wifi 5G.
              We have a community kitchen, living and rooftop available.
              Breakfast on request 10 and 15 soles, since 7am to 11am
              We follow all the covid protocols: Cleaning shoes before access, hand alcool on common areas, gun thermometer, finger oxygen meter.
              Our rooms can be shared only for the same family or arrival group.",
max_people: 4,
price_per_person: 100,
number_of_beds: 4,
}

room_6 = Room.find_or_initialize_by(name: "Quintuple Room")
room_6.attributes = {
description: "Include 2 private bathrooms inside the room - All the rooms have private bathrooms, hot water 24hrs, wifi 5G.
              We have a community kitchen, living and rooftop available.
              Breakfast on request 10 and 15 soles, since 7am to 11am
              We follow all the covid protocols: Cleaning shoes before access, hand alcool on common areas, gun thermometer, finger oxygen meter.
              Our rooms can be shared only for the same family or arrival group.",
max_people: 5,
price_per_person: 120,
number_of_beds: 5,
}

room_1.save!
puts "room_1.save!"

room_2.save!
puts "room_2.save!"

room_3.save!
puts "room_3.save!"

room_4.save!
puts "room_4.save!"

room_5.save!
puts "room_5.save!"

room_6.save!
puts "room_6.save!"
