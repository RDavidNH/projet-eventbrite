# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Event.destroy_all
# Attendance.destroy_all

users = []
events = []

user = User.create(
  first_name: 'test',
  last_name: 'test user',
  email: 'admin789@yopmail.com',
  password: 'adminadmin',
  password_confirmation: 'adminadmin',
  description: 'fake user for test'
)

# create some Events
10.times do
  events << Event.create(
    start_date: Faker::Date.in_date_period,
    duration: Faker::Number.within(range: 1..5),
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(sentence_count: 8),
    price: Faker::Commerce.price,
    location: Faker::Address.city,
    user: user
  )

end

# create 10 users with 5 events each
10.times do |i|
    user = User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: "ebadmin#{i}@yopmail.com",
        password: 'adminadmin',
        password_confirmation: 'adminadmin',
        description: 'fake user for test'
    )

    rand(0..8).times do
        events << Event.create(
            start_date: Faker::Date.in_date_period,
            duration: Faker::Number.within(range: 1..5),
            title: Faker::Lorem.sentence,
            description: Faker::Lorem.paragraph(sentence_count: 8),
            price: Faker::Commerce.price,
            location: Faker::Address.city,
            user: user
        )
    end

    users << user

end


# add random users to random events
events.each do |event|
    attendance = Attendance.create(
        user: users[rand(0..users.size)],
        event: event,
        stripe_customer_id: 'stripe_id_132456789'
    )
end
