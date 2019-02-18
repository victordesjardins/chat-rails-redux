# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "destroy existing data"

Channel.destroy_all
User.destroy_all

puts "creating 2 users"

users = [{email: "john@react.com", nickname: "Johnny"}, {email: "franck@redux.com", nickname: "Francky"}]
users.each do |user|
  puts "creating #{user[:nickname]}"
  User.create!(email: user[:email], password: "123456", nickname: user[:nickname])
end

puts "Creating 3 channels"

channels = [ "general", "react", "paris" ]
channels.each do |channel|
  puts "creating #{channel} channel"
  Channel.create!(name: channel)
  puts "creating 10 fake messages"
  10.times do
    random_user = User.all[rand(User.all.length)]
    fake_message = Faker::Lorem.sentence
    message = Message.new(content: fake_message)
    message.user = random_user
    message.channel = Channel.find_by(name: channel)
    message.save!
  end
end



puts "finish"
