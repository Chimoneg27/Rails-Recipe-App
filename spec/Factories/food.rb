FactoryBot.define do
  factory :food do
    name { "Rice" }
    measurement_unit { "g" }
    price { 1.5 }
    quantity { 1 }
    user_id { association(:user).id }
  end
end