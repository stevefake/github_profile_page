
# localhost:3000/repositories/
# https://github.com/stevefake?tab=repositories
# https://api.github.com/users/stevefake

# "/"
#  The root page: text field and a button

# "/profile"
# 


ENV["RACK_ENV"] = ENV["ENV"] || "development"
require "sinatra/base"
require "json"
require "yaml"
require "active_record"
require "./lib/github_repo"
require "pry"

# config_file = File.read "./db/database.yml"   # no db to worry about
# config = YAML.load config_file

ActiveRecord::Base.establish_connection(config[ENV["RACK_ENV"]])

ActiveRecord::Migration.verbose = false

# TacoTweet::Server.run!
GithubRepo.run!
