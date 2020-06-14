FactoryBot.define do
  factory :book do
    title { "プロを目指す人のためのRuby入門" }
    body  { "Rubyの基本的な機能について幅広く理解できたと思います。" }
    image_id { "" }
    association :user
  end
end
