FactoryBot.define do 
  factory :user do
    name { "Pookie" }
    email { "Faker::Internet.email" }
  end
end