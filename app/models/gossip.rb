class Gossip < ApplicationRecord
has_many :tags , through: :posts 
has_many :posts
belongs_to :user



validates :title, presence: true
end
