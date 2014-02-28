class AddSleepReminderHourAndMinuteToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :sleep_reminder_hour, :string
    add_column :alarms, :sleep_reminder_minute, :string
  end
end
