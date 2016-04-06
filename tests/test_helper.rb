ENV["RACK_ENV"] = "test"
require "minitest/autorun"
require "rack/test"
require "pry"

require "./lib/github_repo"
