Rails.application.routes.draw do
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :shopping_list, only: [:index]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
      member do
              put :toggle_public
    end
  end
  resources :users, only: [:index, :show, :new, :create, :destroy]
  root to: 'foods#index'
  get '/public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'
  # get "up" => "rails/health#show", as: :rails_health_check
end
