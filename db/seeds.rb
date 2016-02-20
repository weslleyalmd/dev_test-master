# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user_info = {
  email: "admin@admin.com.br",
  username: "admin",
  first_name: "Admin",
  last_name: "",
  password: "admin123",
  password_confirmation: "admin123",
  admin: :true
}

User.delete_all
User.create!(user_info)
