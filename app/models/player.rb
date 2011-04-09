class Player < ActiveRecord::Base
  has_many :player_game_statistics
  has_many :teams, :through => :team_players
  has_many :team_players

  def name
    first_name+" "+last_name
  end

  def number team
    team_players.select{ |tp| tp.team_id == team.id }.first.number
  end
  
  def season_total_points
    player_game_statistics.map(&:total_points).sum
  end

  def season_total_rebounds
    player_game_statistics.map(&:total_rebounds).sum
  end

  def season_fg
    fgm = player_game_statistics.map(&:fgm).sum
    fga = player_game_statistics.map(&:fga).sum
    "#{fgm} - #{fga}"
  end

  def per_game_fg
    fgm = player_game_statistics.map(&:fgm).sum / season_games.to_f
    fga = player_game_statistics.map(&:fga).sum / season_games.to_f
    "#{fgm} - #{fga}"
  end

  def season_fg_percent
    fgm = player_game_statistics.map(&:fgm).sum
    fga = player_game_statistics.map(&:fga).sum

    fga==0 ? 0 : 100*fgm/fga
  end

  def season_tp
    tpm = player_game_statistics.map(&:tpm).sum
    tpa = player_game_statistics.map(&:tpa).sum
    "#{tpm} - #{tpa}"
  end

  def per_game_tp
    tpm = player_game_statistics.map(&:tpm).sum / season_games.to_f
    tpa = player_game_statistics.map(&:tpa).sum / season_games.to_f
    "#{tpm} - #{tpa}"
  end

  def season_tp_percent
    tpm = player_game_statistics.map(&:tpm).sum
    tpa = player_game_statistics.map(&:tpa).sum
    tpa==0 ? 0 : 100*tpm/tpa
  end

  def season_ft
    ftm = player_game_statistics.map(&:ftm).sum
    fta = player_game_statistics.map(&:fta).sum
    "#{ftm} - #{fta}"
  end

  def per_game_ft
    ftm = player_game_statistics.map(&:ftm).sum / season_games.to_f
    fta = player_game_statistics.map(&:fta).sum / season_games.to_f
    "#{ftm} - #{fta}"
  end

  def season_ft_percent
    ftm = player_game_statistics.map(&:ftm).sum
    fta = player_game_statistics.map(&:fta).sum
    fta==0 ? 0 : 100*ftm/fta
  end

  def season_ast
    player_game_statistics.map(&:ast).sum
  end

  def season_orb
    player_game_statistics.map(&:orb).sum
  end

  def season_drb
    player_game_statistics.map(&:drb).sum
  end

  def season_to
    player_game_statistics.map(&:to).sum
  end

  def season_s
    player_game_statistics.map(&:s).sum
  end

  def season_pf
    player_game_statistics.map(&:pf).sum
  end

  def season_games
    player_game_statistics.count
  end

end

