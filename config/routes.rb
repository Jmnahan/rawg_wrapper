Rails.application.routes.draw do
  namespace :api do
    get '/creator-roles', to: 'creator_roles#index'
    get '/creators', to: 'creators#index'
    get '/creators/:id', to: 'creators#show'
    get '/developers', to: 'developers#index'
    get '/developers/:id', to: 'developers#show'
    get '/games', to: 'games#index'
    get '/games/:id', to: 'games#show'
    get '/games/:game_pk/additions', to: 'games#additions'
    get '/games/:game_pk/development-team', to: 'games#development_team'
    get '/games/:game_pk/game-series', to: 'games#game_series'
    get '/games/:game_pk/achievements', to: 'games#achievements'
  end
end
