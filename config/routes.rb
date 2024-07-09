Rails.application.routes.draw do
  root "articles#index"

  resources :articles, only: [:index, :show] do
    resources :comments, only: :create
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
