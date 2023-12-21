require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name' do
    user = User.new(name: 'John')
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new
    expect(user).not_to be_valid
  end

  it 'has many recipes' do
    user = User.reflect_on_association(:recipes)
    expect(user.macro).to eq(:has_many)
  end

  it 'has many foods' do
    user = User.reflect_on_association(:foods)
    expect(user.macro).to eq(:has_many)
  end

  it 'destroys associated recipes when destroyed' do
    user = User.create(name: 'John')
    recipe = user.recipes.create(name: 'Pasta', preparation_time: 20, cooking_time: 30, description: 'Delicious pasta')
    user.destroy
    expect(Recipe.find_by(id: recipe.id)).to be_nil
  end

  it 'destroys associated foods when destroyed' do
    user = User.create(name: 'John')
    food = user.foods.create(name: 'Tomato', measurement_unit: 'kg', price: 5, quantity: 1)
    user.destroy
    expect(Food.find_by(id: food.id)).to be_nil
  end
end
