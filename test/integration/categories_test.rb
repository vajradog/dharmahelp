# testing model associations
# testing creation of new category from post
# fixtures used for user

require 'test_helper'

class CategoriesTest < ActionDispatch::IntegrationTest
	include Warden::Test::Helpers

	setup do
		@user = users(:one)
		login_as @user
	end

	test "set a category to a post" do
	  visit root_path
		click_link "New Post"
		fill_in 'Title', with: 'Category test title'
		fill_in 'Body', with: 'Category test body'
		select('Prayers', from: 'Category')
		click_button 'Create Post'
		#assert_equal posts_path, current_path
		assert has_content?("Category test title"), "did not attach category successfully"
	end

	test "create a category and attach to a post" do
	  visit root_path
		click_link "New Post"
		fill_in 'Title', with: 'Teachers Category'
		fill_in 'Body', with: 'Category test body'
		fill_in 'create a category', with: 'Teachers'
		click_button 'Create Post'
		#assert_equal posts_path, current_path
		assert has_content?("Teachers"), "did not attach category successfully"
	end
end