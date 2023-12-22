require 'rails_helper'

RSpec.describe 'Food Index Page' do
  before(:each) do
    @user = create(:user)
    @user.confirm
    login_as(@user, scope: :user)
    @food = create(:food, user_id: @user.id)
  end

  it 'can see the add food button' do
    visit foods_path
    expect(page).to have_content('Add Food')
  end

  it 'can see the food table' do
    visit foods_path
    expect(page).to have_content('Food')
  end

  it 'can see a navbar' do
    visit foods_path
    expect(page).to have_content('Sign Out')
  end
end
