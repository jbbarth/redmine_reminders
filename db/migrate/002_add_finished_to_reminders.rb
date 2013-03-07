class AddFinishedToReminders < ActiveRecord::Migration
  def change
    change_table :reminders do |t|
      t.boolean :finished, :default => false
    end
  end
end
