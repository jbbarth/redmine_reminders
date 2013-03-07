class RemindersController < ApplicationController
  unloadable

  before_filter :require_login
  before_filter :find_reminder, :except => [:new, :create]

  def show
  end
  
  def new
    @reminder = Reminder.new
  end
  
  def create
    @reminder = Reminder.new(params[:reminder])
    @reminder.user_id = User.current.id
    if @reminder.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to reminder_path(@reminder)
    else
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @reminder.update_attributes(params[:reminder].merge(:user_id => User.current.id))
      flash[:notice] = l(:notice_successful_update)
      redirect_to reminder_path(@reminder)
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @reminder.destroy
    flash[:notice] = l(:notice_successful_delete)
    redirect_to my_page_path
  end

  private
  def find_reminder
    @reminder = Reminder.find(params[:id])
  end
end
