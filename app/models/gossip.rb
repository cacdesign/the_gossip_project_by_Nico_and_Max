class Gossip < ApplicationRecord
	has_many :posts
	has_many :tags, through: :posts
	belongs_to :user
end
