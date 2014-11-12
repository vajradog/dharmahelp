require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest

	test "clicking 'new post' when not signed in" do
		visit root_path
		click_link "New Post"
		assert_equal new_user_session_path, current_path
	end

	test "anyone can see post" do 
		post = posts(:compassion)
		visit post_path(post)
		assert_equal post_path(post), current_path
	end

	test "create pdf document" do 
		post = posts(:compassion)
		visit post_path(post)
		click_link 'print this document (PDF)'
		assert_equal "/posts/#{post.id}.pdf", current_path
	end
end
