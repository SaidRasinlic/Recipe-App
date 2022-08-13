class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:recipe_foods,
                                      :foods)

    @total_price = []
    @public_recipes.each do |public_recipe|
      total_price = 0

      next unless public_recipe.public == 'public'

      puts "public recipe #{public_recipe.recipe_foods}"
      public_recipe.recipe_foods.each do |recipe_food|
        total_price += recipe_food.food.price * recipe_food.quantity
      end
      @total_price.push(total_price)
    end
  end
end
