require 'rails_helper'

RSpec.describe 'Recipe Index Page' do
  before(:each) do
    @user = create(:user)
    @user.confirm
    @recipe = create(:recipe, user_id: @user.id)
    login_as(@user, :scope => :user)
  end
    
  it 'can see the add recipe button' do
    visit recipes_path
    expect(page).to have_content("Add another recipe")
  end

  it 'can see the recipe name' do
    visit recipes_path
    expect(page).to have_content(@recipe.name)
  end   
    
  it 'can see the recipe table' do
    visit recipes_path
    expect(page).to have_content("Recipes")
  end
    
  it 'can see a navbar' do
    visit recipes_path
    expect(page).to have_content("Sign Out")
  end

  it 'can click the recipe name and be taken to the recipe show page' do
    visit recipes_path
    click_link @recipe.name
    expect(page).to have_content(@recipe.name)
  end   
end