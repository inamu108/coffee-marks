FactoryBot.define do
  factory :shop do
    image{File.open("#{Rails.root}/public/uploads/shop/image/test.JPG")}
    name{"喫茶店"}
    evaluation{3.0}
    station{"渋谷駅"}
    move{"徒歩"}
    time{"5"}
    description{"コーヒーが美味しい"}
    user_id{1}
    
    association :user
  end
end