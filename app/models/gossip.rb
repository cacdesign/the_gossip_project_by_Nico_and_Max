class Gossip < ApplicationRecord
has_many :tags, through: :posts
has_many :posts, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :likes
belongs_to :user



validates :title, presence: true
end
