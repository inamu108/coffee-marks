Rails.application.routes.draw do
  devise_for :users
  
  root to: 'shops#index'

  resources :shops, only: [:index, :new]
  resources :users, only: [:show]
end
