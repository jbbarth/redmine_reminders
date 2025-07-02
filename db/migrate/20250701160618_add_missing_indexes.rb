class AddMissingIndexes < ActiveRecord::Migration[7.2]
  def change
    add_index :reminders, :user_id, if_not_exists: true
  end
end
