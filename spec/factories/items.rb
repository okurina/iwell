FactoryBot.define do
  factory :item do
    category_id        { Faker::Number.between(from: 2, to:3 ) }
    place_id           { Faker::Number.between(from: 2, to: 5) }
    quantity           { Faker::Number.between(from: 1, to: 9_999_999) }
    unit_id            { Faker::Number.between(from: 2, to: 6) }
    price              { Faker::Number.between(from: 1, to: 9_999_999) }
    item_name          { Faker::Lorem.sentence(word_count: 3) }
  end
end
