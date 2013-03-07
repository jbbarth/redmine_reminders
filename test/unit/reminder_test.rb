require File.expand_path('../../test_helper', __FILE__)

class ReminderTest < ActiveSupport::TestCase
  fixtures :users

  test "#create" do
    assert_not_nil Reminder.create(:text => "Hep!", :user_id => 1,
                                   :start_at => "2012-01-01", :end_at => "2012-02-01")
  end
end
