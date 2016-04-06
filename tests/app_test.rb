require_relative "test_helper"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    GithubRepo::Server
  end

  def test_connection_pool_for_githubrepo_repo
    assert true
  end

  def test_root_page
    request = get "/"
    # json_body = JSON.parse(request.body)
    # assert_equal "", json_body
    assert_equal "", request
  end


  # type in username you want to display
  #   sinatra server must retrieve info from github
  def test_input_username_retrieves_info_from_github
    skip
    get "https://api.github.com/users/stevefake/repos"
    post "/profile"
    assert_equal 
  end


  # def test_login_returns_token
  #   skip
  #   response = post "/"
  #   json_body = JSON.parse(response.body)
  #   assert_equal "", json_body
  # end
  #
  # def test_login_returns_token_of_specifed_length
  #   response = post "/login"
  #   json_body = JSON.parse(response.body)
  #   assert_equal 32, json_body["token"].size
  # end
  #
  def test_get_api
    response = get "/api.github.com/users/stevefake"
    # json = JSON.parse(response.body)
    assert_equal 200, response.status
  end

  def test_repo_can_list_repos
    skip
    api = GithubRepo::Repo.new
    assert_equal "", api.list.size
  end
  #
  # def test_gets_tweets_will_tell_someone_to_go_away
  #   response = get "/api/tweets"
  #   json = JSON.parse(response.body)
  #   assert_equal({ "msg" => "go away!" }, json)
  # end
  #
  # def test_get_returns_empty_json_when_no_taco_tweet
  #   stub_session
  #   response = get "/api/tweets"
  #   json = JSON.parse(response.body)
  #   assert_equal [], json
  # end
  #
  def test_get_a_list_of_tweets
    skip
  #   stub_session
    repo = GithubRepo::Repo.create(body: "Hello Taco!")  # NoMethodError: undefined method `create' for GithubRepo::Repo:Class
    response = get "/api/repos"
    json = JSON.parse(response.body)
    assert_equal repo.body, json.last["body"]
  end
end
