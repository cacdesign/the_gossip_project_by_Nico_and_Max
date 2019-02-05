class Tag < ApplicationRecord
has_many :posts
has_many :gossips , through: :posts

validates :title, presence: true

end
