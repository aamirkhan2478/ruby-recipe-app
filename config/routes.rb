# frozen_string_literal: true

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"
Rails.application.routes.draw do
  devise_for :users
  root "foods#index"

  resources :foods, only: [:create, :destroy]
  resources :recipes, only: [:create, :index, :show, :destroy, :update] do
    resources :recipe_foods
  end
  resources :public_recipes, only: [:index]
  resources :shopping_list, only: [:index]
end
