require 'rails_helper'

RSpec.describe 'Recipe Show Page' do
  before(:each) do
    @user = create(:user)
    @user.confirm
    @recipe = create(:recipe, user_id: @user.id)
    login_as(@user, scope: :user)
  end

  it 'can see the recipe name' do
    visit recipe_path(@recipe)
    expect(page).to have_content(@recipe.name)
  end

  it 'can see the recipe description' do
    visit recipe_path(@recipe)
    expect(page).to have_content(@recipe.description)
  end

  it 'can see the make this private button' do
    visit recipe_path(@recipe)
    expect(page).to have_content('Make Private')
  end
end
