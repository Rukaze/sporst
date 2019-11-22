require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup

  end
  
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end

end
