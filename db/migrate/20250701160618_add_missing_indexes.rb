class AddMissingIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :reminders, :user_id, if_not_exists: true
  end
end
