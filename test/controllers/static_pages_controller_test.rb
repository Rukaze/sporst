require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  def setup

  end
  def login_john
    Warden.test_mode!
    @user = users( :john )
    login_as(@user, :scope => :user)
  end
  
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end
  
  test "should get login" do
    get new_user_session_path
    assert_response :success
  end
  
  test "should not get login if already login" do
    login_john
    get new_user_session_path
    assert_redirected_to root_path
  end
  
  
end
