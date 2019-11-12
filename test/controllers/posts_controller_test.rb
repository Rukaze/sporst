require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get baseball" do
    get posts_baseball_url
    assert_response :success
  end

  test "should get basketball" do
    get posts_basketball_url
    assert_response :success
  end

end
