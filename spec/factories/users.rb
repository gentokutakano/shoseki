FactoryBot.define do
  factory :user do
    username { "user" }
    sequence(:email) { |n| "gentoku1234#{n}@gmail.com" }
    password { "password" }
  end
end
