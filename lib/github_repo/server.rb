module GithubRepo
  class Server < Sinatra::Base

# telling Sinatra to service the code in the public folder:
    set :static, true
    set :public_folder, proc { File.join(root, "..", "..", "public") } # navigates up two levels


  end
end
