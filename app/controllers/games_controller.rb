class GamesController < ActionController::Base

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
end
