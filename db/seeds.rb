# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

Comment.destroy_all
PrivateMessage.destroy_all
Post.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all
Like.destroy_all



# - Je crée mes villes
10.times do |index|
	c = City.create(name: Faker::Address.city, zip_code: "75002" )
	p "La ville #{c.name} a été créée"
end

# - Je crée mes users
10.times do |index|
	u = User.create(last_name: Faker::Name.last_name, first_name: Faker::DragonBall.character , description: Faker::Shakespeare.hamlet_quote, email: Faker::Internet.email,city: City.all.sample, age: rand(20..70), password:'Bonjour')
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
	p "Un post a été crée avec le gossip #{post.gossip.title} et le tag #{post.tag.title}"
end

# - Je crée mes commentaires
500.times do 
	comment = Comment.create(content: Faker::Shakespeare.hamlet_quote, user: User.all.sample, gossip: Gossip.all.sample)
	p "Un commentaire a été crée avec le gossip #{comment.gossip.title} et le user  #{comment.user.first_name}"
end

# - Je crée mes commentaires
500.times do 
	like = Like.create(user: User.all.sample, gossip: Gossip.all.sample)
	p "Un like a été crée avec le gossip #{like.gossip.title} et le user  #{like.user.first_name}"
end

=begin
# - Je crée mes privatemessages
500.times do 
	pm = PrivateMessage.create(sender: User.all.sample, content: Faker::HowIMetYourMother.quote, receiver: User.all.sample)
	
end
=end



