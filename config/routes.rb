Rails.application.routes.draw do
  devise_for :users
  
  root to: 'shops#index'

  resources :shops do
    collection do
      get 'list'
      get 'search'
    end
    resources :comments, only: [:create]
  end
  resources :users, only: [:show, :edit, :update]
end
