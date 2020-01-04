FactoryBot.define do
  factory :user do
    name "鈴木花子"
    email "hanako@example.com"
    password "password"
    admin true
    association :organization
    
    trait :not_admin do
      name "佐藤一郎"
      email "ichiro@example.com"
      admin false
    end
  end
end
