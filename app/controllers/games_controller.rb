class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    @game.update_attributes(params[:game])

    redirect_to games_path
  end

  def edit
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.all
  end

  def statistics
    @game = Game.find(params[:game_id])
  end
end
