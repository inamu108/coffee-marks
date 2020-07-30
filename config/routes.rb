Rails.application.routes.draw do
  devise_for :users
  
  root to: 'shops#index'

  resources :shops do
    collection do
      get 'list'
      get 'search'
    end
    post '/likes', to: 'likes#create'
    delete '/likes', to: 'likes#destroy'
    resources :comments, only: [:create]
  end
  resources :users, only: [:show, :edit, :update]
end
