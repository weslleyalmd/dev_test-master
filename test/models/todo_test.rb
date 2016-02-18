require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "should create todo" do
    todo = todos(:valid)
    assert todo.save
  end

  test "should not create todo without name" do
    todo = todos(:invalid)
    assert_not todo.save
  end
end
