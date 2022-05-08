require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test 'should create event when user is logged in' do
    login_as(users(:thulomama))

    assert_difference 'Event.count' do
      post events_url, params: { event: {
                                   title: 'New Article',
                                   date: Date.tomorrow,
                                   description: 'I am not sure right now that a minimum restriction on descriptions should be imposed.' +
                                                'Also I feel like a hundred words is a bit too much' +
                                                'I might reduce the minimum requirement or do away with it altogether'
      }}
    end

    assert_equal 'Event successfully created!', flash.notice
  end

  test 'should not create event when user is not logged in' do
    assert_no_difference 'Event.count' do
      post events_url, params: { event: {
                                   title: 'New Article',
                                   description: 'I am not sure right now that a minimum restriction on descriptions should be imposed.'
      }}

      assert_equal 'You need to login first!', flash.alert
    end
  end
end

