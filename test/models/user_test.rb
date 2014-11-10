require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # handled by devise, :registerable will be disabled
  # other users won't be able to register
  should validate_presence_of(:email)
  should validate_presence_of(:password)
  should validate_uniqueness_of(:email)
end
