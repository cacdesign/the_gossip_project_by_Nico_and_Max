class User < ApplicationRecord
	has_many :received_messages, foreign_key: "receiver_id", class_name: "PrivateMessage"
	has_many :sent_messages, foreign_key: "sender_id", class_name: "PrivateMessage"
	belongs_to :city
	has_many :gossips
end
