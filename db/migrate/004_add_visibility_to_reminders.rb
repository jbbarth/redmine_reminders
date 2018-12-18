class AddVisibilityToReminders < ActiveRecord::Migration[4.2]
  def change
    add_column :reminders, :visibility, :string
  end
end
