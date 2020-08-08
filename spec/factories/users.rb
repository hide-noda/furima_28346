FactoryBot.define do
  factory :user do
    name                    { Faker::Name.initials(number: 2) }
    email                   { Faker::Internet.free_email }
    password                { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation   { password }
    family_name             { Gimei.last.kanji }
    last_name               { Gimei.first.kanji }
    family_name_kana        { Gimei.last.katakana }
    last_name_kana          { Gimei.first.katakana }
    birth_day               { "1989-05-09" }
  end
end
