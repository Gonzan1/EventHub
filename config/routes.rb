Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :events do
    resources :registrations, only: [:create, :destroy]
    resources :reviews, only: [:create]
  end

  resources :venues
  resources :categories
end