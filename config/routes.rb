Rails.application.routes.draw do
  root "homes#index"

  devise_for :users, except: [:index]

  resources :users, only: [:show]

  resources :books

  resources :authors
end
