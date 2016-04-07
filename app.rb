ENV["RACK_ENV"] = ENV["ENV"] || "development"
require 'net/http'
require "sinatra/base"
require "json"
require "yaml"
require "./lib/github_repo"
require "pry"

GithubRepo::Server.run! if $0 == __FILE__
