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

10.times do |x|
  d = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: Faker::Job.title, postal_code: Faker::Number.number(6))
  p = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name)
  a = Appointment.create(doctor_id: rand(1..x), patient_id: rand(1..x), date: Faker::Date.forward(10))
end

p 'Tu as créé 10 docteurs et 10 patients'
