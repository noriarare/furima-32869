FactoryBot.define do
  factory :item do

    name {Faker::Name.initials(number: 5)}
    catch_copy {Faker::Lorem.characters(number: 30)}
    price {Faker::Number.between(from:300,to:9999999)}
    day_id {Faker::Number.between(from:2,to:4)}
    shipping_id {Faker::Number.between(from:2,to:3)}
    from_id {Faker::Number.between(from:2,to:48)}
    status_id {Faker::Number.between(from:2,to:7)}
    category_id {Faker::Number.between(from:2,to:11)}
    association :user

  end
end
