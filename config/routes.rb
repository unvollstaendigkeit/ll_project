Rails.application.routes.draw do
  get 'categories/show'
  root "articles#index"

  resources :articles, only: [:index, :show]
  resources :categories, only: :show

  get "up" => "rails/health#show", as: :rails_health_check
end
