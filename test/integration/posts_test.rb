require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest

	test "clicking 'new post' when not signed in" do
		visit root_path
		click_link "New Post"
		assert_equal new_user_session_path, current_path
	end
end