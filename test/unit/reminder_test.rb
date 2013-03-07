require File.expand_path('../../test_helper', __FILE__)

class ReminderTest < ActiveSupport::TestCase
  fixtures :users

  test "#create" do
    assert_not_nil Reminder.create(:text => "Hep!", :user_id => 1,
                                   :start_at => "2012-01-01", :end_at => "2012-02-01")
  end

  test "#current" do
    r1 = Reminder.create!(:text => "Should see", :user_id => 1, :start_at => 2.days.ago, :end_at => 2.days.from_now)
    r2 = Reminder.create!(:text => "Should not see", :user_id => 1, :start_at => 2.days.ago, :end_at => 2.days.ago)
    current_reminders = Reminder.current
    assert r1.in?(current_reminders)
    assert ! r2.in?(current_reminders)
  end
end
