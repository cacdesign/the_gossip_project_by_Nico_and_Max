class User < ApplicationRecord

attr_accessor :remember_token

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

# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

# Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end


end
