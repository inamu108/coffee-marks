FactoryBot.define do
  factory :user do
    nickname {"タロウ"}
    email{"example@example.com"}
    password{"example1"}
    password_confirmation{"example1"}
    family_name{"山田"}
    first_name{"太郎"}
  end
end