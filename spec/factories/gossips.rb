FactoryBot.define do
  factory :gossip do
    title { "Nini" } 
    user { FactoryBot.create(:user) }  
  end
end