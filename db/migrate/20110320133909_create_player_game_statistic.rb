class CreatePlayerGameStatistic < ActiveRecord::Migration
  def self.up
    create_table :player_game_statistics do |t|
      t.integer :fga, :default => 0
      t.integer :fgm, :default => 0
      t.integer :ftm, :default => 0
      t.integer :fta, :default => 0
      t.integer :tpm, :default => 0
      t.integer :tpa, :default => 0
      t.integer :orb, :default => 0
      t.integer :drb, :default => 0
      t.integer :ast, :default => 0
      t.integer :to, :default => 0
      t.integer :s, :default => 0
      t.integer :pf, :default => 0
      t.integer :player_id
      t.integer :game_id
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :player_game_statistics
  end
end
