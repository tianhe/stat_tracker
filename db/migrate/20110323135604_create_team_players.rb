class CreateTeamPlayers < ActiveRecord::Migration
  def self.up
    unless TeamPlayer.table_exists?
      create_table :team_players do |t|
        t.integer     :team_id
        t.integer     :player_id
        t.integer     :number
        t.timestamps
      end
    end
  end

  def self.down
    drop_table :team_players
  end
end
