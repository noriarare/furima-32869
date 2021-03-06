FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end
    nickname {Faker::Name.initials(number: 5)}
    email {Faker::Internet.free_email}
    password = Faker::Lorem.characters(number:6,min_alpha:1)
    password {password}
    password_confirmation {password}
    last_name {person.last.kanji}
    first_name {person.first.kanji}
    last_name_kana {person.last.katakana}
    first_name_kana {person.first.katakana}
    birthday {Faker::Date.between(from: 120.years.ago,to:Date.today)}
  end
end
