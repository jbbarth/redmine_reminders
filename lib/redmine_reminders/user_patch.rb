require_dependency 'principal'
require_dependency 'user'

class User < Principal
  has_many :reminders
end

module PluginRedmineReminders
  module UserPatch
    def remove_references_before_destroy
      super
      substitute = User.anonymous
      Reminder.where(['user_id = ?', id]).update_all(['user_id = ?', substitute.id])
    end
  end
end

User.prepend PluginRedmineReminders::UserPatch