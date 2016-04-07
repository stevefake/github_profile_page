module GithubRepo
  class Server < Sinatra::Base

    get "/" do
      render_template("lib/github_repo/views/homepage.html.erb")
    end

    def render_template(template_path)
      template = ERB.new(File.read(template_path))
      template.result(binding)
    end
  end
end
