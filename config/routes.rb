Rails.application.routes.draw do
  # La página principal será la lista de eventos
  root "events#index"
  
  # Rutas resourceful (solo lectura: index y show)
  resources :events, only: [:index, :show]
  resources :users, only: [:index, :show]
end