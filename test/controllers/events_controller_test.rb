require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test 'should create event when user is logged in' do
    user = users(:thulomama)
    login_as(user)

    assert_difference 'Event.count' do
      post events_url, params: { event: {
                                   title: 'New Article',
                                   date: Date.tomorrow,
                                   venue: 'Darpan Residency',
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

  test 'buna can choose to attend an event' do
    event = events(:one)
    user = users(:buna)
    login_as(user)

    assert_not event.attendance
    patch event_url(event), params: { commit: 'Ofcourse, I will Attend!' }

    event.reload
    assert event.attendance
  end

  test 'buna can choose not to attend an event' do
    event = events(:one)
    user = users(:buna)
    login_as(user)

    patch event_url(event), params: { commit: 'No, I will not attend' }

    event.reload
    assert_not event.attendance
  end
end
