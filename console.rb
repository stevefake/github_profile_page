ENV["RACK_ENV"] = ENV["ENV"] || "development"
require "./lib/github_repo"
require "pry"

# config_file = File.read "./db/database.yml"
# config = YAML.load config_file

ActiveRecord::Base.establish_connection(config[ENV["RACK_ENV"]])

ActiveRecord::Migration.verbose = false

Pry.start
