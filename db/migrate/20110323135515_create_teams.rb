class CreateTeams < ActiveRecord::Migration
  def self.up
    unless Team.table_exists?
      create_table :teams do |t|
        t.string     :name
        t.timestamps
      end
    end
  end

  def self.down
    drop_table :teams
  end
end
