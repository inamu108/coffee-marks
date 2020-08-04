Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root to: 'shops#index'

  resources :shops do
    collection do
      get 'list'
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  
  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers
      get 'mypage'
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  
end
