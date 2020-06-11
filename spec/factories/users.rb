FactoryBot.define do
  factory :user do
    username { "gentoku"}  
    sequence(:email) { |n| "gentoku1234#{n}@gmail.com" }
    password { "password" }
  end
end
