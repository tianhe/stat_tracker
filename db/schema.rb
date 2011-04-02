# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110325051136) do

  create_table "games", :force => true do |t|
    t.integer  "home_team_id"
    t.integer  "visiting_team_id"
    t.datetime "time"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_game_statistics", :force => true do |t|
    t.integer  "fga",         :default => 0
    t.integer  "fgm",         :default => 0
    t.integer  "ftm",         :default => 0
    t.integer  "fta",         :default => 0
    t.integer  "tpm",         :default => 0
    t.integer  "tpa",         :default => 0
    t.integer  "orb",         :default => 0
    t.integer  "drb",         :default => 0
    t.integer  "ast",         :default => 0
    t.integer  "to",          :default => 0
    t.integer  "s",           :default => 0
    t.integer  "pf",          :default => 0
    t.integer  "player_id"
    t.integer  "game_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.integer  "login_count",        :default => 0
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_players", :force => true do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
