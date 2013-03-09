require File.expand_path("../../test_helper", __FILE__)

class RemindersControllerTest < ActionController::TestCase
  fixtures :users

  def create_reminder
    @rem ||= Reminder.create!(:text => "Hey it's today!", :user_id => 1,
                              :start_at => "2013-03-01", :end_at => "2013-03-03")
  end

  setup do
    @controller = RemindersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    User.current = nil
    @request.session[:user_id] = 1 # admin
  end

  test "#index" do
    rem = create_reminder
    get :index
    assert_response :success
    assert assigns(:reminders).include?(rem)
  end

  test "#new" do
    get :new
    assert_response :success
    assert_template "new"
  end

  test "#create with validation failure" do
    post :create, :reminder => { :text => "" }
    assert_response :success
    assert_template "new"
    assert_tag :tag => "div", :attributes => { :id => "errorExplanation" }
  end

  test "#create" do
    assert_difference "Reminder.count" do
      post :create, :reminder => { :text => "Hey!", :start_at => "2013-03-01", :end_at => "2013-03-03" }
    end
    rem = Reminder.last
    assert_redirected_to reminders_path
    assert_equal "Hey!", rem.text
    assert_equal 1, rem.user_id
  end

  test "#create with back_url" do
    post :create, :reminder => { :text => "Hey!", :start_at => "2013-03-01", :end_at => "2013-03-03" }, :back_url => "/my/page"
    assert_redirected_to my_page_path
  end

  test "#edit" do
    rem = create_reminder
    get :edit, :id => rem.id
    assert_response :success
    assert_template "edit"
  end

  test "#update" do
    rem = create_reminder
    put :update, :id => rem.id, :reminder => { :text => "Blah" }
    assert_redirected_to reminders_path
  end

  test "#update with back_url" do
    rem = create_reminder
    put :update, :id => rem.id, :reminder => { :text => "Blah" }, :back_url => "/my/page"
    assert_redirected_to my_page_path
  end

  test "#destroy" do
    rem = Reminder.create!(:text => "ToBeDestroyed", :user_id => 1,
                           :start_at => "2013-03-01", :end_at => "2013-03-03")
    delete :destroy, :id => rem.id
    assert_redirected_to reminders_path
    assert_nil Reminder.find_by_text("ToBeDestroyed")
  end
end
