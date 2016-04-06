module GithubRepo
  class Server < Sinatra::Base

    get "/profile" do
      render_template("lib/github_repo/views/profile.html.erb")
    end

    post "/profile" do
      payload = JSON.parse(request.body.read)
      [201, GithubRepo::Repo.create(payload).to_json]
    end

    # get '/profile' do
    #   post "/api.github.com/users/stevefake"
    # end

    # get "/api.github.com/users/stevefake" do  # => status: 200
    #   # halt_unless_user
    #
    #   # repos = GithubRepo::Repo.all #<-repos is blank
    #   # [200, repos.to_json]
    # end
    #
    # post "/api.github.com/users/stevefake" do
    #   # halt_unless_user
    #
    #   payload = JSON.parse(request.body.read)
    #   [201, GithubRepo::Repo.create(payload).to_json]
    # end
  end
end
