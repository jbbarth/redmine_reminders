require "spec_helper"

describe "RemindersOnMyPage", type: :system do

  fixtures :projects, :trackers, :issue_statuses, :issues,
           :enumerations, :users, :issue_categories,
           :projects_trackers, :roles, :member_roles,
           :members, :enabled_modules, :workflows

  it "shows current reminders on /my/page" do
    Reminder.create!(:text => "Should see", :user_id => 1, :start_at => 2.days.ago, :end_at => 2.days.from_now)
    Reminder.create!(:text => "Should not see", :user_id => 1, :start_at => "2000-03-01", :end_at => "2000-03-03")
    log_user("admin", "admin")
    visit "/my/page"
    expect(page).to have_selector("#my-page")
    expect(page).to have_selector("div.reminder", text: "Should see")
    expect(page).to_not have_selector("div.reminder", text: "Should not see")
  end

end
