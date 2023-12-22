Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_scope :user do
    get '/auth/logout', to: 'devise/sessions#destroy'
    root to: 'devise/sessions#new'
  end
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :shopping_list, only: [:index]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
      member do
              put :toggle_public
    end
  end
  resources :users, only: [:index, :show, :new, :create, :destroy]
  get '/public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'
end
