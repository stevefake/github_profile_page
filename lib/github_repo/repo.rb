module GithubRepo
  class Repo
    attr_reader :username

    def initialize(username)
      @username = username
    end

    # @endpoint = "https://api.github.com/users/#{@username}/repos"

    def list
      response = query_list
      return JSON.parse(response)
    end

    private

    def query_list
      uri = URI("https://api.github.com/users/#{@username}/repos")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      req = Net::HTTP::Get.new(uri.request_uri)
      req.basic_auth(ENV['GITHUB_USER'], ENV['GITHUB_PASSWORD'])

      response = http.request(req).body
    end

  end
end
