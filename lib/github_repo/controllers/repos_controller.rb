module GithubRepo
  class Server < Sinatra::Base

    post "/profile" do
      api = Repo.new(params["username"])
      repos = api.list
      repos_array = repos.map {|x| x["name"]}
      render_template("lib/github_repo/views/profile.html.erb")
    end

    get "/profile" do
      render_template("lib/github_repo/views/profile.html.erb")
    end
  end
end
