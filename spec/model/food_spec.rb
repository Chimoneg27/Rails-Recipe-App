require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'Marial') }

  context 'with valid attributes' do
    it 'is valid with name, measurement_unit, price, quantity, and user' do
      food = Food.new(name: 'Tomato', measurement_unit: 'kg', price: 5, quantity: 1, user:)
      expect(food).to be_valid
    end
  end

  context 'with missing attributes' do
    it 'is invalid without a name' do
      food = Food.new(measurement_unit: 'kg', price: 5, quantity: 1, user:)
      expect(food).not_to be_valid
    end

    it 'is invalid without a measurement unit' do
      food = Food.new(name: 'Tomato', price: 5, quantity: 1, user:)
      expect(food).not_to be_valid
    end

    it 'is invalid without a price' do
      food = Food.new(name: 'Tomato', measurement_unit: 'kg', quantity: 1, user:)
      expect(food).not_to be_valid
    end

    it 'is invalid without a quantity' do
      food = Food.new(name: 'Tomato', measurement_unit: 'kg', price: 5, user:)
      expect(food).not_to be_valid
    end

    it 'is invalid without a user' do
      food = Food.new(name: 'Tomato', measurement_unit: 'kg', price: 5, quantity: 1)
      expect(food).not_to be_valid
    end
  end
end
