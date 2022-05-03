require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #

  test 'should create user when required information is given' do
    assert_difference 'User.count' do
      post users_url, params: { user: { 
                                  username: 'avi', 
                                  email: 'avi@avi.com',  
                                  password: 'avi',
                                  password_confirmation: 'avi'
      }}
    end

    assert_redirected_to root_path
    assert_equal 'User successfully created', flash.notice
  end

  test 'should not create user when required information is not given' do
    assert_no_difference 'User.count' do
      post users_url, params: { user: { username: '' } }
    end
  end
end

