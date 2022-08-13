require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:all) do
    @user = User.create(name: 'John Doe', email: 'john@test.com')
  end

  describe 'validations' do
    it 'is valid with a user' do
      recipe = Recipe.new(user: @user)
      expect(recipe).to be_valid
    end
  end

  describe 'associations' do
    it 'has many recipe foods' do
      expect(Recipe.new.recipe_foods).to be_a_kind_of(ActiveRecord::Relation)
    end
  end
end
