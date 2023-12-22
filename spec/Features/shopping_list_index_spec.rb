require 'rails_helper'

RSpec.describe 'Shopping List Index Page' do
  before(:each) do
    @user = create(:user)
    @user.confirm
    @food = create(:food, user_id: @user.id)
    @recipe = create(:recipe, user_id: @user.id)
    @recipe_food = create(:recipe_food, recipe: @recipe, food: @food)
    login_as(@user, :scope => :user)
  end

  it 'can see the shopping list text' do
    visit  shopping_list_index_path
    expect(page).to have_content("Shopping List")
  end

  it 'can see the amount of items to buy' do
    visit  shopping_list_index_path
    expect(page).to have_content('Amount of food items to buy')
  end

  it 'can see the quatinty of items to buy' do
    visit  shopping_list_index_path
    expect(page).to have_content('Quantity')
  end
end