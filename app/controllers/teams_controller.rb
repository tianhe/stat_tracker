class TeamsController < ActionController::Base
  def create
    @team = Team.new
    @team.update_attributes(params[:team])

    redirect_to teams_path
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(params[:team])

    redirect_to teams_path
  end

  def new
    @team = Team.new
    @team.players.build
  end

  def edit
    @team = Team.find params[:id]
  end

  def index
    @teams = Team.all
  end
end
