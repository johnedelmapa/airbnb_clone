# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
  fullname:"Okubo Kenshiro",
  email:"kenshirou517@gmail.com",
  password:"Shirou517",
  password_confirmation:"Shirou517"
)

user.skip_confirmation!
user.save!

25.times do |n|
  users = User.new(
    fullname: Faker::Movies::HarryPotter.character,
    email:"user#{n+1}@email.com",
    password:"password",
    password_confirmation:"password"
  )
  users.skip_confirmation!
  users.save!
end