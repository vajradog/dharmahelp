require 'test_helper'

class SearchTest < ActionDispatch::IntegrationTest

	test "when search word exists" do
		visit root_path
		fill_in 'query', with: 'compassion'
		click_button 'Search icon'
		assert_equal posts_path, current_path
		assert has_content?("Compassion"), "did not search correctly"
	end

	test "when search word does not exists" do
		visit root_path
		fill_in 'query', with: 'john doe'
		click_button 'Search icon'
		assert_equal posts_path, current_path
		assert has_no_content?("Compassion"), "search not functioning correctly"
	end
end