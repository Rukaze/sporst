require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get baseball" do
    get sports_path(kind:"baseball")
    assert_response :success
  end

 

end
