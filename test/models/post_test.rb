# basic validations and association test

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_uniqueness_of(:title)
  should validate_presence_of(:body)
  should belong_to(:category)
end
