Rails.application.routes.draw do
  root "articles#index"
  get "/articles", to: "articles#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
