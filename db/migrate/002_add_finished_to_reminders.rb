class AddFinishedToReminders < ActiveRecord::Migration[4.2]
  def change
    change_table :reminders do |t|
      t.boolean :finished, :default => false
    end
  end
end
