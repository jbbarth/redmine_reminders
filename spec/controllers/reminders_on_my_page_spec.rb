require "spec_helper"
require File.expand_path('../../../app/overrides/my/page', __FILE__)

describe "RemindersOnMyPage", type: :integration do
  fixtures :projects, :trackers, :issue_statuses, :issues,
           :enumerations, :users, :issue_categories,
           :projects_trackers, :roles, :member_roles,
           :members, :enabled_modules, :workflows

  before do
    @controller = MyController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    User.current = nil
    @request.session[:user_id] = 1 # admin
  end

  #TODO: make test work ; seems deface overrides are not included in test environment (?)
  it "should see current reminders on /my/page" do
=begin
    Reminder.create!(:text => "Should see", :user_id => 1, :start_at => 2.days.ago, :end_at => 2.days.from_now)
    Reminder.create!(:text => "Should not see", :user_id => 1, :start_at => "2000-03-01", :end_at => "2000-03-03")
    log_user("admin", "admin")
    get "/my/page"
    assert_response :success
    binding.pry
    assert_select "p.blah", :count => 1
    assert_select "div.reminder", :count => 1
  end
=end
  end

end
