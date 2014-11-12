require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
	include Devise::TestHelpers
  include Warden::Test::Helpers
  
	setup do
		@category = categories(:prayers)
		@user = users(:one)
		sign_in @user
	end

	test "should get category index" do
		get :index
		assert_response :success
	end

	test "should get category new" do 
		get :new
		assert_response :success
	end

	test "should create category" do
	  assert_difference('Category.count') do
	  	post :create, category: { name: "life"}
	  end 

	  assert_redirected_to categories_path
	end

	test "should show category" do
		get :show, id: 1
		assert_response :success
	end

	test "should get edit" do 
		get :edit, id: 1
		assert_response :success
	end

	test "update category" do
		patch :update, id: @category, category: { name: @category.name}
		assert_redirected_to category_path(assigns(:category))
	end

	test "should destroy category" do
		
		assert_difference('Category.count', -1) do
			delete :destroy, id: @category
		end

		assert_redirected_to categories_path
	end

end 