Rails.application.routes.draw do  
  # root 'home#Index'
  # resources :recipe_foods
  root 'foods#index'
  devise_for :users
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users 
  # resources :foods, only: [:new, :edit, :update, :show, :destory]
  
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes do
    resources :recipe_foods
  end

  resources :public_recipes, only: [:index]
  resources :shoppings, only: [:index]
  
end
