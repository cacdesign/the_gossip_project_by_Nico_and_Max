FactoryBot.define do
  factory :private_message do
    sender { FactoryBot.create(:user) }  
    receiver { FactoryBot.create(:user) }  
    content { "sport" } 
  end
end