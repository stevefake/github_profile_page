ENV["RACK_ENV"] = ENV["ENV"] || "development"
require 'net/http'
require "sinatra/base"
require "json"
require "yaml"
require "./lib/github_repo"
require "pry"

# localhost:3000/repositories/
# https://github.com/stevefake?tab=repositories
# https://api.github.com/users/stevefake
# https://api.github.com/users/stevefake/repos




# "/"
#  The root page: text field and a button
#     uri = URI("https://api.github.com/repos/tacookenna/legacy_associations_and_validations/issues/#{issue_number}")


# "/profile"
# display your clone of the GitHub profile page for that user




GithubRepo::Server.run! if $0 == __FILE__
