class Alarm < ActiveRecord::Base
  belongs_to :user
  has_many :reminders
  has_many :days
  attr_accessible :title, :wakeup_reminder_time, :sleeping_hour, :sleeping_minute, :is_dismiss, :sleep_reminder_time, :sleep_reminder_type,
  				  :sleeping_ampm, :repeat_monday,  :repeat_tuesday,  :repeat_wednesday,  :repeat_thursday,  :repeat_friday,  :repeat_saturday,
  				   :repeat_sunday, :wakeup_hour, :wakeup_minute, :wakeup_ampm, :sleep_reminder_time_unit, :wakeup_reminder_type

end
