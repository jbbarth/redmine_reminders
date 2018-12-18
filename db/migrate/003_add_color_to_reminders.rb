class AddColorToReminders < ActiveRecord::Migration[4.2]
  def change
    change_table :reminders do |t|
      t.string :color
    end
  end
end
