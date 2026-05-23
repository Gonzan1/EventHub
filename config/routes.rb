Rails.application.routes.draw do
  root "events#index"

  resources :events do
    resources :registrations, only: [:create, :destroy]
    resources :reviews, only: [:create]
  end

  resources :venues
  resources :categories
end