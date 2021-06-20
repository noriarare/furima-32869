FactoryBot.define do
  factory :order_address do

    token {"tok_abcdefghijk00000000000000000"}
    user_id {'1'}
    item_id {'2'}
    post {'555-5555'}
    from_id {'2'}
    municipality {'横浜'}
    house_number {'横1-1'}
    building {'ナカトミビル'}
    tel {'09012345678'}
  end
end