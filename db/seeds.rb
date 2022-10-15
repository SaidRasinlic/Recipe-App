# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_1 = User.create(name: 'Hailey Castro', email: 'user1@test.com', password: '1234567', password_confirmation: '1234567')
user_2 = User.create(name: 'Ross Campbell', email: 'user2@test.com', password: '1234567', password_confirmation: '1234567')
user_3 = User.create(name: 'Tristan Banks', email: 'user3@test.com', password: '1234567', password_confirmation: '1234567')
user_4 = User.create(name: 'Tracey Thompson', email: 'user4@test.com', password: '1234567', password_confirmation: '1234567')

# Recipe Seeds
recipe_1 = Recipe.create(name: 'Artichokes', preparation_time: 5, cooking_time: 20, description: 'Simple and delicious steamed artichokes. Serve these with melted butter for dipping. You will need a pan with a steamer insert.', public: false, user: user_1)
recipe_2 = Recipe.create(name: 'Avocado Deviled Eggs', preparation_time: 20, cooking_time: 20, description: 'This is a twist on the traditional deviled egg. I usually use 1 or 2 fewer yolks for the filling.', public: true, user: user_1)
recipe_3 = Recipe.create(name: 'Slammin Salmon', preparation_time: 136, cooking_time: 8, description: 'An amazing culinary delight. Hands down the greatest grilled salmon ever. Easy and delicious.', public: true, user: user_3)
recipe_4 = Recipe.create(name: 'Stuffed Peppers', preparation_time: 30, cooking_time: 65, description: 'Roasted green bell peppers are stuffed with feta cheese and a mixture of rice and green onions.', public: true, user: user_2)
recipe_5 = Recipe.create(name: 'Quick Halushki', preparation_time: 75, cooking_time: 60, description: 'Polish dish combining bacon, fried cabbage and egg noodles.', public: false, user: user_2)
recipe_6 = Recipe.create(name: 'Hasenpfeffer', preparation_time: 40, cooking_time: 90, description: 'Rabbit stew made with bacon, wine, garlic, shallots, other herbs and spices.', public: true, user: user_1)


# Inventories
inventory_1 = Inventory.create(name: 'Store', user_id: 1)
inventory_2 = Inventory.create(name: 'Kitchen', user_id: 1)
inventory_3 = Inventory.create(name: 'Store', user_id: 2)
inventory_4 = Inventory.create(name: 'Kitchen', user_id: 2)

# Foods
food_1 = Food.create(name: 'Apple', measurement_unit: 'Kg', price: '5', user: user_1)
food_2 = Food.create(name: 'Pineapple', measurement_unit: 'Kg', price: '4', user: user_1)
food_3 = Food.create(name: 'Chicken breasts', measurement_unit: 'units', price: '2', user: user_1)
food_4 = Food.create(name: 'Garlic', measurement_unit: 'grams', price: '0.1', user: user_2)
food_5 = Food.create(name: 'Red Wine', measurement_unit: 'liter', price: '4', user: user_2)
food_6 = Food.create(name: 'Bacon', measurement_unit: 'grams', price: '0.5', user: user_1)

# RecipeFoods
RecipeFood.create(quantity: 1, recipe: recipe_1, food: food_1 )
RecipeFood.create(quantity: 50, recipe: recipe_1, food: food_4 )
RecipeFood.create(quantity: 5, recipe: recipe_1, food: food_3 )
RecipeFood.create(quantity: 1, recipe: recipe_2, food: food_1 )
RecipeFood.create(quantity: 50, recipe: recipe_2, food: food_4 )
RecipeFood.create(quantity: 5, recipe: recipe_2, food: food_3 )

# InventoryFoods
InventoryFood.create(quantity: 5, inventory: inventory_1, food: food_1)
InventoryFood.create(quantity: 2, inventory: inventory_1, food: food_2)
InventoryFood.create(quantity: 10, inventory: inventory_1, food: food_3)
InventoryFood.create(quantity: 5, inventory: inventory_2, food: food_4)
InventoryFood.create(quantity: 2, inventory: inventory_2, food: food_5)
InventoryFood.create(quantity: 10, inventory: inventory_3, food: food_6)
