class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :text
      t.date :start_at
      t.date :end_at
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
