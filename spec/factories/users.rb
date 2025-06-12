FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
  end

  factory :article do
    title { "Hello Pookie" }
    body { Faker::Lorem.sentence }
    status { "public" }
    association :user
  end

  factory :comment do
    body { Faker::Lorem.sentence }
    association :article
    association :user
  end
end
