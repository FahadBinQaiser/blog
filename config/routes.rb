Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
 post "/dark_mode", to: "dark_mode#create", as: :dark_mode

  resources :articles do
    resources :comments
  end
    resources :posts
end
