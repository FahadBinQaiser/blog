Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :likes, only: [ :create, :destroy ]
  resource :dark_mode, only: [ :create ], controller: "dark_mode"
  resources :articles do
    resources :comments
  end
    resources :posts
end
