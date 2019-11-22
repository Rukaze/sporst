require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
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
                                        titile: "",
                                        content: "" } }

    assert_template 'posts/new'
    assert_select 'div.alert' , "Titleを入力してください
        Contentを入力してください"
  end
  
  test "should not allow empty content and title" do
    get edit_path(@post)
    assert_template 'posts/new'
    patch eidt_path, params: { post: { kind: @league.kind,
                                        league: @league.league,
                                        titile: "",
                                        content: "" } }

    assert_template 'posts/new'
    assert_select 'div.alert' , "Titleを入力してください
        Contentを入力してください"
  end
 
end
