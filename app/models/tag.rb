class Tag < ApplicationRecord
	has_many :posts
	has_many :gossips, through: :posts
end
