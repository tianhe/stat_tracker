class Team < ActiveRecord::Base
  has_many :team_players
  has_many :players, :through => :team_players
  has_many :games
  accepts_nested_attributes_for :players, :allow_destroy => true

end