require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'John') }

  it 'is valid with name, preparation_time, cooking_time, description, and user' do
    recipe = Recipe.new(
      name: 'Spaghetti Bolognese',
      preparation_time: 20,
      cooking_time: 30,
      description: 'A delicious pasta dish',
      user:
    )

    expect(recipe).to be_valid
  end

  it 'is invalid without a name' do
    recipe = Recipe.new(
      preparation_time: 20,
      cooking_time: 30,
      description: 'A delicious pasta dish',
      user:
    )

    expect(recipe).not_to be_valid
  end

  it 'is invalid without a user' do
    recipe = Recipe.new(
      name: 'Spaghetti Bolognese',
      preparation_time: 20,
      cooking_time: 30,
      description: 'A delicious pasta dish'
    )

    expect(recipe).not_to be_valid
  end

  it 'is invalid with non-integer preparation_time' do
    recipe = Recipe.new(
      name: 'Spaghetti Bolognese',
      preparation_time: 20.5,
      cooking_time: 30,
      description: 'A delicious pasta dish',
      user:
    )

    expect(recipe).not_to be_valid
  end

  it 'is invalid with non-integer cooking_time' do
    recipe = Recipe.new(
      name: 'Spaghetti Bolognese',
      preparation_time: 20,
      cooking_time: 30.5,
      description: 'A delicious pasta dish',
      user:
    )

    expect(recipe).not_to be_valid
  end

  it 'is valid with a public attribute' do
    recipe = Recipe.new(
      name: 'Spaghetti Bolognese',
      preparation_time: 20,
      cooking_time: 30,
      description: 'A delicious pasta dish',
      user:,
      public: true
    )

    expect(recipe).to be_valid
  end
end
