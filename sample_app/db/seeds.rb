# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(	name:  "Example User",
							email: "example@railstutorial.org",
							password:              "foobar",
							password_confirmation: "foobar",
							admin: true )

98.times do |n|
	name  = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "password"
	User.create!(name:  name,
							 email: email,
							 password:              password,
							 password_confirmation: password)
end

User.create!(	name:  "Chuck Norris",
							email: "chuck@norris.me",
							password:              "foobar",
							password_confirmation: "foobar",
							admin: true )

users = User.order(:created_at).take(5)
50.times do
	content = Faker::Lorem.sentence(5)
	users.each { |user| user.microposts.create!(content: content) }
end

user = User.find_by(name: "Chuck Norris")
60.times do
	content = Faker::ChuckNorris.fact.truncate(140)
	user.microposts.create!(content: content)
end
