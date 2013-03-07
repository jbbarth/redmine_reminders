class AddColorToReminders < ActiveRecord::Migration
  def change
    change_table :reminders do |t|
      t.string :color
    end
  end
end
