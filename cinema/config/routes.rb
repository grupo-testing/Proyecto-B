Rails.application.routes.draw do
  root 'movies#index'
  get '/movies/new', to: 'movies#new'
  post '/movies/new', to: 'movies#create', as: 'movies_create'
  get '/movies/:id', to: 'movies#show', as: 'movie_show'
  resources :reservations
  resources :screenings
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
