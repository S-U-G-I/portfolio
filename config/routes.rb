Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"
  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end
end
