FactoryBot.define do
  factory :book do
    title { "プロを目指す人のためのRuby入門" }
    body  { "Rubyの基本的な機能について幅広く理解できたと思います。
      また、gemやRake、bundle、MVCなど、のちのち開発していく上で
      必要な知識についてもインデクシングできるようにさらっと書いてあるのでかなり良本です。
      まさしく、「プロを目指す人のためのRuby入門」といった感じです。" }
    image_id { "" }
    association :user
  end
end
