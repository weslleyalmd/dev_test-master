require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "login and browse site" do
    # login via https
    https!
    get "/users/sign_in"
    assert_response :success

    post_via_redirect "/users/sign_in", user: { email: users(:valid).email, password: 'weslleyalmd' }
    assert_equal '/', path

    https!(false)

    get "/todos"
    assert_response :success
    assert assigns(:todos)
  end
end