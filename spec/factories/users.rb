FactoryBot.define do
  factory :user do
    first_name { "Nini" } 
    city { FactoryBot.create(:city) }  
  end
end