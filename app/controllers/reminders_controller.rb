class RemindersController < ApplicationController
  unloadable

  before_filter :authorize_global
  before_filter :find_reminder, :except => [:new, :create, :index]

  def index
    scope = Reminder

    @limit = per_page_option
    @reminder_count = scope.count
    @reminder_pages = Paginator.new @reminder_count, @limit, params[:page]
    @offset ||= @reminder_pages.offset
    @reminders =  scope.order("updated_at desc, end_at desc").limit(@limit).offset(@offset)

    render :layout => !request.xhr?
  end

  def new
    @reminder = Reminder.new
  end
  
  def create
    @reminder = Reminder.new(params[:reminder])
    @reminder.user_id = User.current.id
    if @reminder.save
      flash[:notice] = l(:notice_successful_create)
      redirect_back_or_default reminders_path
    else
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @reminder.update_attributes(params[:reminder].merge(:user_id => User.current.id))
      flash[:notice] = l(:notice_successful_update)
      redirect_back_or_default reminders_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @reminder.destroy
    flash[:notice] = l(:notice_successful_delete)
    redirect_to reminders_path
  end

  private
  def find_reminder
    @reminder = Reminder.find(params[:id])
  end
end
