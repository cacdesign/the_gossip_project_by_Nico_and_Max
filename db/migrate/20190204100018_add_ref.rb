class AddRef < ActiveRecord::Migration[5.2]
  def change
  	add_reference :posts, :gossip, foreign_key: true
  	add_reference :posts, :tag, foreign_key: true
  	add_reference :gossips, :user, foreign_key: true
  	add_reference :users, :city, foreign_key: true

  	add_reference :private_messages, :receiver, index: true
  	add_reference :private_messages, :sender, index: true
  end
end
