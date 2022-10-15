# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :foods, except: [:update]

  resources :inventories, only: [:index, :show, :destroy, :new, :create] do
    get 'foods/new', to: 'inventory_foods#new'
    post 'foods', to: 'inventory_foods#create'
    delete 'foods/:id', to: 'inventory_foods#destroy', as: 'food'
  end

  resources :recipes, only: [:index, :show, :new, :create, :destroy, :put ] do
    resources :recipe_foods, path: 'food', only: [:destroy, :new, :create]
  end

  match 'recipes/:recipe_id' => 'recipes#toogle_public', as: :toogle_public, via: :patch
  match 'public_recipes' => 'recipes#public_recipes', as: :public_recipes, via: :get

  get 'shopping_list', to: "shopping_list#index"

  # Defines the root path route ("/")
  root 'recipes#public_recipes'
end
