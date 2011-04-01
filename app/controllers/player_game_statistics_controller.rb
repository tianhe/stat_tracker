class PlayerGameStatisticsController < ActionController::Base
  respond_to :html, :xml, :json

  def create
    @player = Player.find_or_create_by_id params[:id]

    @game_statistic = PlayerGameStatistic.new
    @game_statistic.update_attributes(params[:game_statistic])

    redirect_to edit_player_game_statistic_path(@game_statistic)
  end

  def update
    @player_game_statistic = PlayerGameStatistic.find params[:id]
    @player_game_statistic.tally params[:field].to_sym
    render :nothing => true
  end

  def new
    @game_statistic = PlayerGameStatistic.new
  end

  def show
    @player_game_statistic = PlayerGameStatistic.find params[:id]
    respond_to do |format|
      format.json { render :json => @player_game_statistic }
    end
  end

  def track_game
    game = Game.find params[:id]
    @player_game_statistics = PlayerGameStatistic.find_all_by_game_id(params[:id])
    @visiting_team = game.visiting_team
    @home_team = game.home_team
  end

  def edit
    @player_game_statistic = PlayerGameStatistic.find params[:id]
  end

  def index
    @game_statistics = PlayerGameStatistic.all
  end
end
