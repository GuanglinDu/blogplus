require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_template :index
    assert_template layout: "layouts/application"

    assert_response :success
    assert_not_nil assigns(:posts)

    assert_select 'title', 'Blogplus'
    assert_select 'td a', minimum: 4
  end

  test "should create post" do
    assert_difference 'Post.count' do
      post :create, post: {title: 'Some title', text: 'My text'}
    end
    assert_redirected_to post_path assigns(:post)
    assert_equal 'Post was successfully created.', flash[:notice]
  end

  test "should not create post and instead render new" do
    post :create, post: {nonexist1: 'title'}
    assert_template :new
  end

  test "should update post" do
    patch :update,
          id: posts(:one),
          post: {title: 'New Title', text: 'New text'}
    assert_redirected_to post_path(assigns(:post))
  end

  test "should not update post and instead render edit" do
    patch :update,
          id: posts(:one),
          post: {nonexistent1: 'nothing'}
    assert_template :edit
  end

  test "should show post" do
    get :show, {id: posts(:one).id}
    assert_template :show
    assert assigns(:comments)
    assert_select 'h2', 'Post:' 
    assert_select 'h3', 'Add a comment:' 
  end

  test "should destroy post" do
    assert_difference 'Post.count', -1 do
      #post :destroy, {id: posts(:one).id}
      delete :destroy, {id: posts(:one).id} # same as the above
    end
    assert_redirected_to posts_path
  end
end
