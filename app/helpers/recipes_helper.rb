# frozen_string_literal: true

# RecipesHelper
module RecipesHelper
  def count_items(obj)
    obj.count
  end

  def total_price(recipe)
    sum = 0
    recipe.recipe_foods&.each { |i| sum += i.quantity * i.food.price }
    sum
  end
end
