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

c5 = Company.create(name: "Fontera", user_id: User.second.id, phone: "123-456-7890", size: 25, status: "Hiring", location: "55 Somerset Road, Green Point, Cape Town, South Africa", latitude: -33.913228, longitude: 18.416357)
c5.avatar = File.open('app/assets/images/seeds/fontera.png')
c5.save!

c6 = Company.create(name: "White Wall Web", user_id: User.second.id, phone: "123-456-7890", size: 23, status: "Hiring", location: "The Avalon Building, Corner Hope and Mill Streets, Cape Town, South Africa", latitude: -33.933768, longitude: 18.417421)
c6.avatar = File.open('app/assets/images/seeds/whitewallweb.png')
c6.save!

c7 = Company.create(name: "Website Design South Africa", user_id: User.second.id, phone: "123-456-7890", size: 13, status: "Hiring", location: "10 Derwent Road, Tamboerskloof, Cape Town, South Africa", latitude: -33.933744, longitude: 18.405916)
c7.avatar = File.open('app/assets/images/seeds/siyelo.png')
c7.save!

c8 = Company.create(name: "Imbali Studio", user_id: User.second.id, phone: "123-456-7890", size: 20, status: "Hiring", location: "7 Wale St, Cape Town,South Africa", latitude: -33.924320, longitude: 18.418715)
c8.avatar = File.open('app/assets/images/seeds/imablistudio.png')
c8.save!

c9 = Company.create(name: "Liquid Thought", user_id: User.second.id, phone: "123-456-7890", size: 22, status: "Hiring", location: "26A Shortmarket St, Cape Town, South Africa", latitude: -33.922953, longitude: 18.420893)
c9.avatar = File.open('app/assets/images/seeds/siyelo.png')
c9.save!

c10 = Company.create(name: "Sea Monster", user_id: User.second.id, phone: "123-456-7890", size: 29, status: "Hiring", location: "80A Upper Maynard St, Cape Town,South Africa", latitude: -33.934285, longitude: 18.419491)
c10.avatar = File.open('app/assets/images/seeds/seamonster.png')
c10.save!

["Ruby", "Rails", "Java", "Python", "jQuery", "C", "C++", "Ocaml", "Swift"].each {|name|
	Technology.create(name: name)
}

["Information", "Social Media", "Consulting", "Finance", "Web", "Applications", "Gaming", "Virtual Reality", "Education"].each {|name|
	Tag.create(name: name)
}
