class Player < ActiveRecord::Base
  has_many :player_game_statistics
  has_many :teams, :through => :team_players
  has_many :team_players

  def name
    first_name+" "+last_name
  end
end
