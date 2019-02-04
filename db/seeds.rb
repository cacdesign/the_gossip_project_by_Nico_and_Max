# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'



# - Je crée mes villes
10.times do |index|
	c = City.create(name: Faker::Address.city)
	p "La ville #{c.name} a été créée"
end

# - Je crée mes users
10.times do |index|
	u = User.create(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, city: City.all.sample, age: rand(20..70))
	p "L'utilisateur #{u.last_name} de #{u.age}ans a été crée"
end


# - Je crée mes gossips
10.times do |index|
	g = Gossip.create(title: Faker::HarryPotter.spell, content: Faker::HarryPotter.quote, user: User.all.sample)
	p "Le gossip #{g.title} avec le contenu #{g.content} a été créé"
end


# - Je crée mes tags
10.times do |index|
	t = Tag.create(title: Faker::Color.color_name)
	p "Le tag #{t.title} a été crée"
end


# - Je crée mes posts
10.times do |index|
	post = Post.create(gossip: Gossip.all.sample, tag: Tag.all.sample)
	p "Un post a été crée avec le gossip #{post.gossip} et le tag #{post.tag}"
end


# - Je crée mes privatemessages
10.times do |index|
	pm = PrivateMessage.create(content: Faker::HarryPotter.quote, sender: User.all.sample, receiver: User.all.sample)
	p "Le message privé #{pm.content} a été envoyé entre #{pm.sender.last_name} et #{pm.receiver.last_name}"
end


=begin
# - Je crée mes appointments
10.times do |index|
	a = Appointment.create(date: Faker::Date.between(20.days.ago, Date.today), doctor: Doctor.all.sample, patient: Patient.all.sample, city: City.all.sample)
	p "L'Appointment #{a.date} avec le docteur #{a.doctor.last_name} et le patient #{a.patient.last_name} a été crée"
end
=end