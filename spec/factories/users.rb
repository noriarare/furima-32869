FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 5)}
    email {Faker::Internet.free_email}
    password = Faker::Lorem.characters(number:6,min_alpha:1)
    password {password}
    password_confirmation {password}
    last_name {Faker::Name.initials(number: 4)}
    first_name {Faker::Name.initials(number: 4)}
    last_name_kana {Faker::Name.initials(number: 4)}
    first_name_kana {Faker::Name.initials(number: 4)}
    birthday {Faker::Date.between(from: 70.years.ago,to:Date.today)}
  end
end
