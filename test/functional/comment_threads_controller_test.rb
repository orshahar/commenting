require 'test_helper'

class CommentThreadsControllerTest < ActionController::TestCase
  setup do
    @comment_thread = comment_threads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_threads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_thread" do
    assert_difference('CommentThread.count') do
      post :create, :comment_thread => @comment_thread.attributes
    end

    assert_redirected_to comment_thread_path(assigns(:comment_thread))
  end

  test "should show comment_thread" do
    get :show, :id => @comment_thread.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @comment_thread.to_param
    assert_response :success
  end

  test "should update comment_thread" do
    put :update, :id => @comment_thread.to_param, :comment_thread => @comment_thread.attributes
    assert_redirected_to comment_thread_path(assigns(:comment_thread))
  end

  test "should destroy comment_thread" do
    assert_difference('CommentThread.count', -1) do
      delete :destroy, :id => @comment_thread.to_param
    end

    assert_redirected_to comment_threads_path
  end
end
