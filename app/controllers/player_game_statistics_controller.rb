class PlayerGameStatisticsController < ApplicationController
  respond_to :html, :xml, :json

  def new
    @player_game_statistic = PlayerGameStatistic.new
  end

  def create
    @player = Player.find_or_create_by_id params[:id]

    @player_game_statistic = PlayerGameStatistic.new
    @player_game_statistic.update_attributes(params[:game_statistic])

    redirect_to edit_player_game_statistic_path(@player_game_statistic)
  end

  def edit
    @player_game_statistic = PlayerGameStatistic.find params[:id]
  end

  def update
    @player_game_statistic = PlayerGameStatistic.find params[:id]
    @player_game_statistic.tally params[:field].to_sym
    render :nothing => true
  end

  def show
    @player_game_statistic = PlayerGameStatistic.find params[:id]
    respond_to do |format|
      format.json { render :json => @player_game_statistic}
    end
  end
end
