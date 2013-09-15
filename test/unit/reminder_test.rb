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
    r3 = Reminder.create!(:text => "Should see", :user_id => 1, :start_at => 2.days.ago, :end_at => 2.days.from_now, :finished => true)
    current_reminders = Reminder.current
    assert r1.in?(current_reminders)
    assert ! r2.in?(current_reminders)
    assert ! r3.in?(current_reminders)
  end

  test "#visible doesn't restrict visibility for 'all' or nil" do
    User.current = nil
    opts = {:text => "Should see", :user_id => 1, :start_at => 2.days.ago, :end_at => 2.days.from_now}
    assert Reminder.create(opts).in?(Reminder.visible)
    assert Reminder.create(opts.merge(:visibility => "all")).in?(Reminder.visible)
  end

  test "#visible restricts visibility to an organization if 'organization:X'" do
    u = User.current = User.find(2) #non-admin
    opts = {:text => "Should see", :user_id => 1, :start_at => 2.days.ago, :end_at => 2.days.from_now, :visibility => "organization:53"}
    assert ! Reminder.create(opts).in?(Reminder.visible)
    def u.organization_id; 53; end
    assert Reminder.create(opts).in?(Reminder.visible)
  end

  test "#visible returns all reminders for administrators" do
    u = User.current = User.find(1) #admin
    opts = {:text => "Should see", :user_id => 1, :start_at => 2.days.ago, :end_at => 2.days.from_now, :visibility => "organization:53"}
    assert Reminder.create(opts).in?(Reminder.visible)
  end


  test "#color" do
    assert_equal "salmon", Reminder.new.color
    assert_equal "foo", Reminder.new(:color => "foo").color
  end
end
