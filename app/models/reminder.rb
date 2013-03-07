class Reminder < ActiveRecord::Base
  unloadable

  belongs_to :user

  validates_presence_of :text, :start_at, :end_at, :user_id

  scope :current, lambda{ where("start_at <= ? AND end_at >= ?", Date.today, Date.today) }
end
