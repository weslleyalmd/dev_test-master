require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should create user" do
    user = users(:valid)
    assert user.save
  end

  test "should not create user" do
    user = users(:without_email)
    assert_not user.save
  end
end
