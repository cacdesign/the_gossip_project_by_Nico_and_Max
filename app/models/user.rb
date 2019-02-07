class User < ApplicationRecord
has_many :gossips
belongs_to :city
has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
has_many :received_messages, foreign_key: 'receiver_id', class_name: 'PrivateMessage'
has_many :comments, dependent: :destroy
has_many :likes
has_secure_password

validates :first_name, presence: true
validates :last_name, presence: true
validates :email,
 presence: true,
    uniqueness: true,
   format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "please give a true email" }

validates :age, presence: true

end
