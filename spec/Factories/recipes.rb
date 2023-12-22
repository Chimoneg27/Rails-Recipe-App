FactoryBot.define do
  factory :recipe do
    name { "Rice" }
    preparation_time { 10 }
    cooking_time { 20 }
    description { "Cook rice" }
    public { true }
    user_id { association(:user).id }
  end
end