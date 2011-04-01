class CreateGames < ActiveRecord::Migration
  def self.up
    unless Game.table_exists?
      create_table :games do |t|
        t.integer     :home_team_id
        t.integer     :visiting_team_id
        t.datetime    :time
        t.string      :description
        t.timestamps
      end
    end
  end

  def self.down
    drop_table :games
  end
end
