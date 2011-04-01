class PlayerGameStatistic < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  def tally field
    self.increment! field
    self.increment! (field[0..1]+"a").to_sym if [:fgm, :ftm, :tpm].include?(field)
  end

  def find_team
    game = self.game
    player = self.player

    [game.visiting_team, game.home_team].select { |t| t.players.include? player }.first
  end

  def self.in_game game
    where(:game_id => game.id)
  end

  def self.for_team team
    where("player_id IN (?)", team.players)
  end

  def self.game_statistics_for_team game, team
    PlayerGameStatistic.in_game(game).for_team(team)
  end
end
