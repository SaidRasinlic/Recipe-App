# frozen_string_literal: true

require 'rails_helper'
require_relative '../features_helper'

feature 'User Index' do
  background do
    @name1 = 'Tom'
    @user1 = FeaturesHelper.create_and_activate_user(@name1)
    @recipes = FeaturesHelper.create_recipes_for_user(@user1, count: 1).first

    visit new_user_session_path

    fill_in 'Email', with: 'tom@gmail.com'
    fill_in 'Password', with: '123456'

    click_button 'Log in'
  end

  scenario 'shows all public recipes' do
    expect(page).to have_content 'All Recipes'
  end

  scenario 'gets redirected to recipes page after click' do
    click_link @user1
    expect(page).to have_current_path(recipe_path(@recipes))
  end
end
