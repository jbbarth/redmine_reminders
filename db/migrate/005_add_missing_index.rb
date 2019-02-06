class AddMissingIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :reminders, [:updated_at]
  end
end
