module Rawg
  class Client
    def self.creator_roles
      response = Request.call('get', '/creator-roles')
    end

    def self.creators
      response = Request.call('get', "/creators")
    end

    def self.creator(id)
      response = Request.call('get', "/creators/#{id}")
    end

    def self.developers
      response = Request.call('get', "/developers")
    end

    def self.developer(id)
      response = Request.call('get', "/developers/#{id}")
    end

    def self.games
      response = Request.call('get', "/games")
    end

    def self.game(id)
      response = Request.call('get', "/games/#{id}")
    end

    def self.games_add(game_pk)
      response = Request.call('get', "/games/#{game_pk}/additions")
    end

    def self.dev_team(game_pk)
      response = Request.call('get', "/games/#{game_pk}/development-team")
    end

    def self.game_series(game_pk)
      response = Request.call('get', "/games/#{game_pk}/game-series")
    end

    def self.achievements(game_pk)
      response = Request.call('get', "/games/#{game_pk}/achievements")
    end
  end
end