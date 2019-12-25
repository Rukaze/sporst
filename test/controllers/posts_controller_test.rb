require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  
  def setup
   
    @league = sports(:NPB)
    @post = posts(:one)
    @post2 = posts(:two)
  end
  
  def login_john
     Warden.test_mode!
    @user = users( :john )
    login_as(@user, :scope => :user)
  end
  
  test "should get leagues_select" do
    get sports_path(kind: @league.kind)
    assert_response :success
  end

  test "should not allow empty content and title" do
    login_john
    get new_content_path
    assert_template 'posts/new'
    post create_path, params: { post: { kind: @league.kind,
                                        league: @league.league,
                                        title: "",
                                        content: "" } }

    assert_template 'posts/new'
    #assert_select 'div.alert' , "Titleを入力してください
       # Contentを入力してください"
  end
  
  test "should  allow correct content and title" do
    login_john
    get new_content_path
    assert_template 'posts/new'
    assert_difference 'Post.count', 1 do
    post create_path, params: { post: { kind: @league.kind,
                                        league: @league.league,
                                        title: "NPB",
                                        content: "NPB is fun" } }
    end
    assert_redirected_to index_path(league: @league.league)
    #assert_select
  end
  
  test "should not allow empty content and title edit" do
    login_john
    get post_edit_path(id: 1)
    assert_template 'posts/edit'
    patch post_path(id: 1), params: { post: { kind: @league.kind,
                                        league: @league.league,
                                        title: "",
                                        content: "" } }

    assert_template 'posts/edit'
    #assert_select 'div.alert' , "Titleを入力してください
      #  Contentを入力してください"
  end
 
  test "should  allow edit as correct content and title " do
    login_john
    get post_edit_path(id: 1)
    assert_template 'posts/edit'
    patch post_path(id: 1), params: { post: { kind: @league.kind,
                                        league: @league.league,
                                        title: "NPB",
                                        content: "NPB is fun" } }
    
    assert_redirected_to show_path(id: 1)
    assert_equal("NPB", @post.reload.title)
    
  end
  
  test "should  not allow edit as different user" do
    login_john
    patch post_path(id: @post2.id), params: { post: { kind: @league.kind,
                                        league: @league.league,
                                        title: "NPB",
                                        content: "NPB is fun" } }
    assert_not_equal("NPB", @post2.reload.title)

  end
  
  test "should  not get edit as different user" do
    login_john
    get post_edit_path(id: 2)
    assert_template 'posts/show'
  end
  
  test "should get show page" do
    get show_path(id: @post.id)
    assert_template 'posts/show'
    assert_select 'div.post_show'
  end
  
  test 'shold get index page' do
    get index_path(league: @post.league)
    assert_template 'posts/index'
    assert_select 'div.post-index'
  end
  
  test 'shold not get new_content_path' do
    get new_content_path
    assert_redirected_to new_user_session_path
    
  end
end
