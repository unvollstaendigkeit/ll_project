Rails.application.routes.draw do
  get 'comments/create'
  root "articles#index"

  # Define the articles resource with nested comments
  resources :articles do
    resources :comments, only: :create
  end

  # Custom routes for articles
  get "/articles", to: "articles#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

