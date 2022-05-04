require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test 'should create event' do
    assert_difference 'Event.count' do
      post events_url, params: { event: {
                                   title: 'New Article',
                                   description: 'I am not sure right now that a minimum restriction on descriptions should be imposed.' +
                                                'Also I feel like a hundred words is a bit too much'
      }}
    end

    assert_equal 'Event successfully created!', flash.notice
  end

  test 'should not create event with terse description' do
    assert_no_difference 'Event.count' do
      post events_url, params: { event: {
                                   title: 'New Article',
                                   description: 'I am not sure right now that a minimum restriction on descriptions should be imposed.'
      }}
    end
  end
end

