module Api
  class CreatorsController < ApplicationController
    def index
      creators = Rawg::Client.creators
      render json: creators
    end

    def show
      creator = Rawg::Client.creator
      render json: creator
    end
  end
end