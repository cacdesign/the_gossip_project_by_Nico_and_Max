class Gossip < ApplicationRecord
has_many :tags, through: :posts
has_many :posts, dependent: :destroy
belongs_to :user



validates :title, presence: true
end
