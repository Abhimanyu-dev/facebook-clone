# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or newd alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.new({ name: "Star Wars" }, { name: "Lord of the Rings" })
#   Character.new(name: "Luke", movie: movies.first)

require 'faker'

puts "seeding data"



100.times do
    name = Faker::Name.name
    username = name.split()[0].downcase
    email = username + "@gmail.com"
    password = "123456"
    # p name
    # p email
    # p username
    new_user = User.create({name: name, username: username, email: email, password: password})
end

users = User.all()

puts users