Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  resources :inventory_foods
  resources :foods
  resources :inventories
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
 resources :users, only: [:index]
  
end
