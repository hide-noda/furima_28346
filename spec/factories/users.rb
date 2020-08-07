FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    name                    {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    family_name             {Faker::Name.last_name}
    last_name               {Faker::Name.first_name}
    family_name_kana        {Faker::firstNameKana}
    last_name_kana          {Faker::lastNameKana}
    birth_day               {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end