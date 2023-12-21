# spec/models/recipe_food_spec.rb
require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:food) do
    Food.create(name: 'Tomato', measurement_unit: 'kg', price: 5, quantity: 1, user: User.create(name: 'John'))
  end
  let(:recipe) do
    Recipe.create(name: 'Salad', preparation_time: 15, cooking_time: 0, description: 'Healthy salad',
                  user: User.create(name: 'Jane'))
  end

  it 'is valid with quantity, food, and recipe' do
    recipe_food = RecipeFood.new(quantity: 2, food:, recipe:)
    expect(recipe_food).to be_valid
  end

  it 'is invalid without a food' do
    recipe_food = RecipeFood.new(quantity: 2, recipe:)
    expect(recipe_food).not_to be_valid
  end

  it 'is invalid without a recipe' do
    recipe_food = RecipeFood.new(quantity: 2, food:)
    expect(recipe_food).not_to be_valid
  end
end
