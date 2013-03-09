class Reminder < ActiveRecord::Base
  unloadable

  belongs_to :user

  validates_presence_of :text, :start_at, :end_at, :user_id

  scope :current, lambda{ where("finished = ? AND start_at <= ? AND end_at >= ?",
                                false, Date.today, Date.today) }
  scope :visible, lambda{ where("visibility IS NULL OR visibility = 'all' OR visibility = 'organization:#{User.current.organization_id}'") }

  def color
    read_attribute(:color).presence || "salmon"
  end
end
