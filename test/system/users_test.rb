require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit users_url
  #
  #   assert_selector "h1", text: "Users"
  # end

  test 'creating a new user successfully' do
    visit signup_url

    fill_in :Username, with: 'Avi'
    fill_in :Email, with: 'avi@avi.com'
    fill_in :Password, with: 'avi'
    fill_in 'Password confirmation', with: 'avi'
    click_on 'Sign Up'

    assert_text 'User successfully created'
  end

  test 'creating a new user unsuccessfully' do
    visit new_user_path

    click_on 'Sign Up'

    assert_text 'Error Messages'
  end
end
