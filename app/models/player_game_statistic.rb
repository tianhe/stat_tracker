class PlayerGameStatistic < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  def tally field
    self.increment! field
    self.increment! (field[0..1]+"a").to_sym if [:fgm, :ftm, :tpm].include?(field)

    if field == :tpm
      self.increment!(:fgm)
      self.increment!(:fga)
    end

    self.increment!(:fga) if field == :tpa
  end

  def find_team
    game = self.game
    player = self.player

    [game.visiting_team, game.home_team].select { |t| t.players.include? player }.first
  end

  def total_points
    ftm + (fgm - tpm)*2 + tpm*3
  end

  def total_rebounds
    orb + drb
  end

  def print_fg
    "#{fgm} - #{fga}"
  end

  def fg_percent
    fga==0 ? 0 : 100*fgm/fga
  end

  def print_tp
    "#{tpm} - #{tpa}"
  end

  def tp_percent
    tpa==0 ? 0 : 100*tpm/tpa
  end

  def print_ft
    "#{ftm} - #{fta}"
  end

  def ft_percent
    fta==0 ? 0 : 100*ftm/fta
  end


  def self.in_game game
    where(:game_id => game.id)
  end

  def self.for_team team
    where("player_id IN (?)", team.players)
  end

  def self.by_game_and_team game, team
    PlayerGameStatistic.in_game(game).for_team(team)
  end

end
