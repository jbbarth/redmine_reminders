class Reminder < ActiveRecord::Base
  unloadable

  belongs_to :user

  validates_presence_of :text, :start_at, :end_at, :user_id

  scope :current, lambda{ where("finished = ? AND start_at <= ? AND end_at >= ?",
                                false, Date.today, Date.today) }

  def color
    read_attribute(:color).presence || "salmon"
  end
end
