module GithubRepo
  class Repo
    # validates :body, presence: true

    ENDPOINT = "https://api.github.com/users/stevefake"
    def list
      # Turn the request body into a ruby object
      response = query_list
      return JSON.parse(response)
    end

    private

    def query_list
      uri = URI(ENDPOINT)
      # Build client
      http = Net::HTTP.new(uri.host, uri.port)
      # http.use_ssl = true

      # Build request
      req = Net::HTTP::Get.new(uri.request_uri)
      req.basic_auth(ENV['GITHUB_USER'], ENV['GITHUB_PASSWORD'])

      # Actually Perform the request
      response = http.request(req).body
    end

  end
end
