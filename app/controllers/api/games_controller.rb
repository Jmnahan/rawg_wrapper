module Api
  class GamesController < ApplicationController
    def index
      games = Rawg::Client.games
      render json: games
    end

    def show
      game = Rawg::Client.game
      render json: game
    end

    def additions
      games_add = Rawg::Client.games_add
      render json: games_add
    end

    def development_team
      dev_team = Rawg::Client.dev_team
      render json: dev_team
    end

    def games_series
      game_series = Rawg::Client.game_series
      render json: game_series
    end

    def achievements
      achievements = Rawg::Client.achievements
      render json: achievements
    end
  end
end