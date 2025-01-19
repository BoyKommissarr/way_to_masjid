FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    full_name { Faker::Internet.username }
    role { User::MUAZZIN }

    trait :admin do
      role { User::ADMIN }
    end

    trait :muazzin do
      role { User::MUAZZIN }
    end
  end
end
