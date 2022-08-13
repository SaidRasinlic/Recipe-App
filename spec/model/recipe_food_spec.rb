require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:all) do
    @user = User.create(name: 'John Doe', email: 'john@test.com')
  end

  describe 'validations' do
    it 'is not valid without a quantity' do
      recipe_food = RecipeFood.new(recipe: @recipe, food: @food)
      expect(recipe_food).to_not be_valid
    end

    it 'is not valid without a recipe' do
      recipe_food = RecipeFood.new(quantity: 1, food: @food)
      expect(recipe_food).to_not be_valid
    end

    it 'is not valid without a food' do
      recipe_food = RecipeFood.new(quantity: 1, recipe: @recipe)
      expect(recipe_food).to_not be_valid
    end
  end
end
