require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'should login a user when correct credentials are passed' do
    user = users(:one)
    post sessions_url, params: { email: 'thulomama@thulomama.com', password: 'secret'}

    assert_redirected_to root_path
    assert_equal "#{ user.username.capitalize }, You are successfully logged in", flash.notice
    assert_equal user.id, session[:user_id]
  end

  test 'should not login a user when incorrect credentials are passed' do
    user = users(:one)
    post sessions_url, params: { email: 'thulomama@thulomama.com', password: 'ecret'}

    assert_response :internal_server_error
    assert_equal "Email or password is invalid", flash.alert
    assert_nil session[:user_id]
  end

  test 'should logout user' do
    user = users(:one)
    post sessions_url, params: { email: 'thulomama@thulomama.com', password: 'secret'}

    delete session_url(user)
    assert_redirected_to root_path
    assert_equal 'Successfully, logged out!', flash.notice
    assert_nil session[:user_id]
  end
end
