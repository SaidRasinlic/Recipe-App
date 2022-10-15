# frozen_string_literal: true

# ShoppingList helper
module ShoppingListHelper
  def build_shopping_list(recipe, inventory, list = [])
    recipe.each do |recipe_item|
      inventory_data = inventory.select { |inventory_item| inventory_item[:id] == recipe_item[:id] }
      inventory_quantity = inventory_data.empty? ? 0 : inventory_data[0][:inventory_quantity]
      shopping_list_quantity = recipe_item[:recipe_quantity] - inventory_quantity
      if shopping_list_quantity.positive?
        list.push({ name: recipe_item[:food_name], quantity: shopping_list_quantity, unit: recipe_item[:unit],
                    price: recipe_item[:unit_price] * shopping_list_quantity })
      end
    end
    list
  end
end
