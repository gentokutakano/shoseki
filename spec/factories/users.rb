FactoryBot.define do
  factory :user do
    username { "user" }
    sequence(:email) { |n| "gentoku1234#{n}@gmail.com" }
    password { "password" }
  end

  factory :gentoku do
    username { "gentoku" }
    sequence(:email) { |n| "gentoku4321#{n}@gmail.com" }
    password { "password" }
  end
end
