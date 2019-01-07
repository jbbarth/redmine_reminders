require "spec_helper"
require "active_support/testing/assertions"

describe RemindersController do
  render_views
  include ActiveSupport::Testing::Assertions
  fixtures :users

  def create_reminder
    @rem ||= Reminder.create!(:text => "Hey it's today!", :user_id => 1,
                              :start_at => "2013-03-01", :end_at => "2013-03-03")
  end

  before do
    @controller = RemindersController.new
    @request = ActionDispatch::TestRequest.create
    @response = ActionDispatch::TestResponse.new
    User.current = nil
    @request.session[:user_id] = 1 # admin
  end

  it "should #index" do
    rem = create_reminder
    get :index
    expect(response).to be_successful
    assert assigns(:reminders).include?(rem)
  end

  it "should #new" do
    get :new
    expect(response).to be_successful
    assert_template "new"
  end

  it "should #create with validation failure" do
    post :create, params: {:reminder => {:text => ""}}
    expect(response).to be_successful
    assert_template "new"
    assert_select "div[id='errorExplanation']"
  end

  it "should #create" do
    assert_difference "Reminder.count" do
      post :create, params: {:reminder => {:text => "Hey!", :start_at => "2013-03-01", :end_at => "2013-03-03"}}
    end
    rem = Reminder.last
    expect(response).to redirect_to(reminders_path)
    expect(rem.text).to eq "Hey!"
    expect(rem.user_id).to eq 1
  end

  it "should #create with back_url" do
    post :create, params: {:reminder => {:text => "Hey!", :start_at => "2013-03-01", :end_at => "2013-03-03"}, :back_url => "/my/page"}
    expect(response).to redirect_to(my_page_path)
  end

  it "should #edit" do
    rem = create_reminder
    get :edit, params: {:id => rem.id}
    expect(response).to be_successful
    assert_template "edit"
  end

  it "should #update" do
    rem = create_reminder
    put :update, params: {:id => rem.id, :reminder => {:text => "Blah"}}
    expect(response).to redirect_to(reminders_path)
  end

  it "should #update with back_url" do
    rem = create_reminder
    put :update, params: {:id => rem.id, :reminder => {:text => "Blah"}, :back_url => "/my/page"}
    expect(response).to redirect_to(my_page_path)
  end

  it "should #destroy" do
    rem = Reminder.create!(:text => "ToBeDestroyed", :user_id => 1,
                           :start_at => "2013-03-01", :end_at => "2013-03-03")
    delete :destroy, params: {:id => rem.id}
    expect(response).to redirect_to(reminders_path)
    expect(Reminder.find_by_text("ToBeDestroyed")).to be_nil
  end
end
