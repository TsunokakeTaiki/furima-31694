FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.free_email}
    password              {"ab0000"}
    password_confirmation {password}
    first_name            {"仮ノな"}
    last_name             {"太郎"}
    first_name_kana       {"カリノナ"}
    last_name_kana        {"タロウ"}
    birth_date            {"1990-01-01"}
  end
end