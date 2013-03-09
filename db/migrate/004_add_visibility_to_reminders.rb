class AddVisibilityToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :visibility, :string
  end
end
