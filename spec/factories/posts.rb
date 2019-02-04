FactoryBot.define do
  factory :post do
    tag { FactoryBot.create(:tag) }  
    gossip { FactoryBot.create(:gossip) }  
  end
end