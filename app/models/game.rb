class Game < ActiveRecord::Base
  belongs_to :home_team, :class_name => "Team", :foreign_key => :home_team_id
  belongs_to :visiting_team, :class_name=> "Team", :foreign_key => :visiting_team_id
  has_many :player_game_statistics

  after_create{ create_player_game_statistics }

  def create_player_game_statistics
    game_players = [home_team, visiting_team].map(&:players).flatten
    game_players.each { |p| PlayerGameStatistic.create({:player_id => p.id, :game_id => id}) }
  end

  def home_team_points
    player_game_statistics = PlayerGameStatistic.by_game_and_team(self, home_team)
    player_game_statistics.map(&:total_points).sum
  end

  def visiting_team_points
    player_game_statistics = PlayerGameStatistic.by_game_and_team(self, visiting_team)
    player_game_statistics.map(&:total_points).sum
  end
end
