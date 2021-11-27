Rails.application.routes.draw do
  root 'movies#new'
  get '/movies/new', to: 'movies#new'
  get '/movies/:id', to: 'movies#show'
  post '/movies/new', to: 'movies#create', as: 'movies_create'
  resources :reservations
  resources :screenings
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
