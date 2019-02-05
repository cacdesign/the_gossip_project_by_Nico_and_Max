# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

PrivateMessage.destroy_all
Post.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

# - Je crée mes villes
10.times do |index|
	c = City.create(name: Faker::Address.city)
	p "La ville #{c.name} a été créée"
end

# - Je crée mes users
10.times do |index|
	u = User.create(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, description: Faker::Shakespeare.hamlet_quote,email: Faker::Internet.email,city: City.all.sample, age: rand(20..70))
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