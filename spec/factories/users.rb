FactoryBot.define do
  factory :user do
    username { "gentoku"}  
    sequence(:email) { |n| "gentoku#{n}@gmail.com" }
    password { "password" }
  end
end
