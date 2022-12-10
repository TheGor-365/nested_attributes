Rails.application.routes.draw do
  root 'trips#index'

  resources :destinations
  resources :itineraries
  resources :trips
end
