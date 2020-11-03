# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

users = []
events = []
attendances = []

10.times do
  users <<
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(domain: '@yopmail.com'),
    description: Faker::Lorem.paragraphs(number: 1)
  )
end

10.times do
  events <<
  Event.create(
    start_date: Faker::Date.forward(days: 31),
    duration: Faker::Number.within(range: 1..25) * 5,
    title: Faker::Lorem.characters(number: 20),
    description: Faker::Lorem.characters(number: 25),
    price: Faker::Number.within(range: 1..1000),
    location: Faker::Address.city,
    user: users.sample)
end

10.times do
  attendances <<
  Attendance.create(user: users.sample, event:events.sample)
end
