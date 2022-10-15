# frozen_string_literal: true

# Shopping List Controller
class ShoppingListController < ApplicationController
  def index
    @recipe, @recipe_ingredients = fetch_recipe
    @inventory, @inventory_quantities = fetch_inventory || []
    @shopping_list = build_shopping_list(@recipe_ingredients, @inventory_quantities)
  end

  private

  def fetch_recipe
    recipe = Recipe.find_by_id(params[:recipe_id])
    recipe_ingredients = []
    recipe&.recipe_foods&.each do |food|
      food_data = Food.find_by_id(food.food_id)
      recipe_ingredients.push({ id: food.food_id, food_name: food_data.name, unit: food_data.measurement_unit,
                                recipe_quantity: food.quantity, unit_price: food_data.price })
    end
    [recipe, recipe_ingredients]
  end

  def fetch_inventory
    inventory = Inventory.find_by_id(params[:inventory_id])
    inventory_quantities = []
    inventory&.inventory_foods&.each do |food|
      inventory_quantities.push({ id: food.food_id, inventory_quantity: food.quantity })
    end
    [inventory, inventory_quantities]
  end
end
