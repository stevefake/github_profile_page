module GithubRepo
  class Server < Sinatra::Base
    post "/login" do
      token = SecureRandom.hex
      GithubRepo::User.create(password: token)
      [201, { token: token }.to_json]
    end
  end
end
