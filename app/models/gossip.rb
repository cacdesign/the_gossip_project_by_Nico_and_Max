class Gossip < ApplicationRecord
has_many :tags, through: :posts
has_many :posts, dependent: :destroy
has_many :comments
belongs_to :user



validates :title, presence: true
end
