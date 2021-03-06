# basic validations and association test

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
  should have_many(:posts)
end
