class PlayersController < ApplicationController
  def create
    @player = Player.new
    @player.update_attributes(params[:player])

    redirect_to players_path
  end

  def edit
    @player = Player.find params[:id]
  end

  def update
    @player = Player.find params[:id]
    @player.update_attributes(params[:player]) ?
      flash[:notice] = "Player Info Successfully Updated" :
      flash[:error] = "Error Updating Player Info"

    redirect_to players_path
  end

  def new
    @player = Player.new
  end

  def show
    @player = Player.find params[:id]
    @player_game_statistics = @player.player_game_statistics
  end

  def index
    @players = Player.all
  end
end
