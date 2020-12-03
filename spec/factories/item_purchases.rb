FactoryBot.define do
  factory :item_purchase do
    token {"tok_abcdefghijk00000000000000000"}
    postial_code { '123-4567' }
    prefecture_id { 2 }
    city { '札幌市' }
    addresses { '一番街1-1' }
    building { '札幌ビル' }
    phone_number{ '01234567890' }
    item_id { 1 }
    user_id { 1 }
  end
end
