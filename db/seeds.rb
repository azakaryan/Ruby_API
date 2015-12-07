# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

initial_users = [
  { username:'User 1', email: "User_1@gmail.com" },
  { username:'User 2', email: "User_2_@gmail.com" },
  { username:'User 3', email: "User_3_@gmail.com" },
  { username:'User 4', email: "User_4_@gmail.com" },
  { username:'User 5', email: "User_5_@gmail.com" },
]

def add_user(u)
  user = User.where({email: u[:email]})
  yield(u) unless user.any?
end

initial_users.each do |user| 
  add_user(user) do |u|
  	puts "#-> adding default User #{u[:username]}"
  	User.create(u)
  end
end