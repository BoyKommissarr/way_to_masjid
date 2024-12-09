FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    full_name { Faker::Internet.username }
  end
end
