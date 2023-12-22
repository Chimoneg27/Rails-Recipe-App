FactoryBot.define do
  factory :recipe_food do
    quantity { 3 }
    recipe_id { association(:recipe).id }
    food_id { association(:food).id }
  end
end
