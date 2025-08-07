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
    status { "public" }
    association :article
    association :user
  end
  FactoryBot.define do
  factory :post do
    title { "Test Post Title" }
    association :user

    after(:build) do |post|
        post.image.attach(
        io: File.open(Rails.root.join("spec", "fixtures", "test-image.jpg")),
        filename: "test-image.jpg",
        content_type: "image/jpeg"
      )
    end
  end
end
end
