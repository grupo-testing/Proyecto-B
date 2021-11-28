Rails.application.routes.draw do
  root 'movies#index'
  get '/movies', to: 'movies#index'
  get '/movies/new'                          , to: 'movies#new'
  get '/reservations/schedule'               , to: 'reservations#schedules'
  get '/movies/:id/screenings'               , to: 'reservations#schedules', as: 'select_screening'
  get '/screening/:id/reservations/new'      , to: 'reservations#new'      , as: 'reservations_new'
  get '/reservations'                        , to: 'reservations#index'

  post '/movies/new'                          , to: 'movies#create'        , as: 'movies_create'
  post '/screening/:id/reservations/new'      , to: 'reservations#create'  , as: 'reservations_create'
  post '/reservations/schedule'               , to: 'reservations#schedule'
  post '/'                                    , to: 'movies#search_movies', as: 'search_movies'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
