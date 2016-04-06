require "erb"
require "sinatra/base"
require "json"
require "yaml"
require "./lib/github_repo/repo"
require "./lib/github_repo/user"
require "./lib/github_repo/server"
require "./lib/github_repo/controllers/repos_controller"
require "./lib/github_repo/controllers/login_controller"
require "./lib/github_repo/controllers/homepage_controller"

module GithubRepo
end
