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
    assert_equal true, request.ok?
    assert_equal false, request.i_m_a_teapot?
    assert_equal 200, request.status
    assert_equal "text/html;charset=utf-8", request.content_type
    assert_equal true, request.body.include?("Github root page ape")
  end

  def test_we_have_a_profile_page
    request = get "/profile"
    assert_equal true, request.ok?
    assert_equal 200, request.status
    assert_equal "text/html;charset=utf-8", request.content_type
    assert_equal true, request.body.include?("Github profile page ape")
  end

  def test_get_api_size
    api = GithubRepo::Repo.new

    assert_equal 18, api.list.size
  end

  def test_list_api_names
    api = GithubRepo::Repo.new
    repos = api.list
    repos_array = repos.map {|x| x["name"]}
    assert_equal ["2016.03.08", "2016.03.10", "2016.03.14", "2016.03.15",
      "2016.03.16", "2016.03.17", "2016.03.23", "2016.03.28", "2016.03.29",
      "bam-", "employee_reviews_solution", "github_profile_page", "hello-world",
      "my_blog", "stevefake.github.com", "Steves-Gist-Example",
      "Wed_2016.03.09", "Wk1D3"], repos_array
  end


  # type in username you want to display
  #   sinatra server must retrieve info from github
  def test_input_username_retrieves_info_from_github
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
