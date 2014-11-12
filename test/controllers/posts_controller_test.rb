# basic testing for the restful resources
# included Devise and warden for easy user assignment.
# fixtures used for post and user


require 'test_helper'

class PostsControllerTest < ActionController::TestCase
	include Devise::TestHelpers
  include Warden::Test::Helpers
  
	setup do
		@post = posts(:compassion)
		@user = users(:one)
		sign_in @user
	end

	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:posts)
	end

	test "should get new" do 
		get :new
		assert_response :success
	end

	test "should create post" do
	  assert_difference('Post.count') do
	  	post :create, post: { body: "hey man", title: "new title"}
	  end 

	  assert_redirected_to posts_path
	end

	test "should show post" do
		get :show, id: 1
		assert_response :success
	end

	test "should get edit" do 
		get :edit, id: 1
		assert_response :success
	end

	test "update post" do
		patch :update, id: @post, post: { body: @post.body, title: @post.title}
		assert_redirected_to post_path(assigns(:post))
	end

	test "should destroy post" do
		assert_difference('Post.count', -1) do
			delete :destroy, id: @post
		end

		assert_redirected_to posts_path
	end

end 