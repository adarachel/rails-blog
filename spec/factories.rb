FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    photo { Faker::Internet.url }
    bio { Faker::Lorem.sentence }

    trait :user_with_posts do
      after(:create) do |user|
        create_list(:post, 3, author: user)
        user.update_posts_counter
      end
    end
  end

  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    association :author, factory: :user

    trait :with_comments do
      after(:create) do |post|
        create_list(:comment, 3, post:, author: post.author)
      end
    end
  end

  factory :comment do
    text { Faker::Lorem.sentence }
    association :author, factory: :user
    association :post
  end
end
