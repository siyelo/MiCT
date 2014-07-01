# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "user1@siyelo.com", password: "12345678", name: "John Doe")
User.create(email: "user2@siyelo.com", password: "12345678", name: "Jim Doe")
User.create(email: "user3@siyelo.com", password: "12345678", name: "Jane Doe")

c1 = Company.create(name: "Siyelo", user_id: User.first.id, phone: "123-456-7890", size: 16, status: "Hiring", location: "79 Roeland Street, Cape Town, South Africa", latitude: -33.9295489, longitude: 18.4222019)
c1.avatar = File.open('app/assets/images/seeds/siyelo.png')
c1.save!

c2 = Company.create(name: "Greenpop", user_id: User.first.id, phone: "123-456-7890", size: 17, status: "Hiring", location: "70 Roeland Street, Cape Town, South Africa", latitude: -34.9295489, longitude: 18.4222019)
c2.avatar = File.open('app/assets/images/seeds/url.jpg')
c2.save!

c3 = Company.create(name: "Platform 45", user_id: User.first.id, phone: "123-456-7890", size: 18, status: "Hiring", location: "82 Roeland Street, Cape Town, South Africa", latitude: -33.9295489, longitude: 19.4222019)
c3.avatar = File.open('app/assets/images/seeds/siyelo.png')
c3.save!

c4 = Company.create(name: "Facebook", user_id: User.second.id, phone: "123-456-7890", size: 19, status: "Hiring", location: "62 Roeland Street, Cape Town, South Africa", latitude: -33.9295489, longitude: 19.4222019)
c4.avatar = File.open('app/assets/images/seeds/url.jpg')
c4.save!

["Ruby", "Rails", "Java", "Python", "jQuery", "C", "C++", "Ocaml", "Swift"].each {|name|
	Technology.create(name: name)
}

["Information", "Social Media", "Consulting", "Finance", "Web", "Applications", "Gaming", "Virtual Reality", "Education"].each {|name|
	Tag.create(name: name)
}
