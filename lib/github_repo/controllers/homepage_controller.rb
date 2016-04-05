module GithubRepo
  class Server < Sinatra::Base
    get "/" do
      @tweets = GithubRepo::Repo.all
      render_template("lib/github_repo/views/homepage.html.erb")
    end

    post "/repos" do
      GithubRepo::Repo.create(body: params["body"])
      redirect to("/")
    end

    def render_template(template_path)
      template = ERB.new(File.read(template_path))
      template.result(binding)
    end
  end
end
