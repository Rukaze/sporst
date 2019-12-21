require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  def setup
    Warden.test_mode!
    @user = users( :john )
    login_as(@user, :scope => :user)
    @league = sports(:NPB)
    @post = posts(:one)
  end
  
  test "should get leagues_select" do
    get sports_path(kind: @league.kind)
    assert_response :success
  end

  test "should not allow empty content and title" do
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
 
  test "should  allow correct content and title edit" do
    get post_edit_path(id: 1)
    assert_template 'posts/edit'
    patch post_path(id: 1), params: { post: { kind: @league.kind,
                                        league: @league.league,
                                        title: "NPB",
                                        content: "NPB is fun" } }

    assert_redirected_to show_path(id: @post.id)
    
  end
end
