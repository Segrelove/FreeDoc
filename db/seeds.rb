require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Patient.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'patients'")
Doctor.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'doctors'")
Appointment.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'appointments'")
City.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cities'")
Specialty.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'specialties'")
DoctorSpecialty.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'doctor_specialties'")


City.create(name: "Paris")
City.create(name: "Bordeaux")
City.create(name: "Caen")

5.times do |x|
  Specialty.create(name: Faker::Job.title)
  p "Specialité #{x} créé"
end

10.times do |x|
  Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, postal_code: Faker::Number.number(6), city_id: rand(1..3))
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, city_id: rand(1..3))
  Appointment.create(doctor_id: rand(1..x), patient_id: rand(1..x), date: Faker::Date.forward(10), city_id: rand(1..3))
  DoctorSpecialty.create(doctor_id: rand(1..x), specialty_id: rand(1..5))
end

p 'Tu as créé 10 docteurs, 10 patients, 10 RDV, 3 villes et associé chaque doctor et specialty entre eux'

