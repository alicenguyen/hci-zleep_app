require 'uri'


class TwilioController < ApplicationController
	def message
	        render 'message.xml.erb', :content_type => 'text/xml'

	end
	def validate

		    render 'validate.xml.erb', :content_type => 'text/xml'
	end

	def scheduler
		if (params[:task] == "scheduler")
			current_hour = Time.now.strftime("%I").to_f
			current_minute = Time.now.strftime("%M").to_f
			current_ampm = Time.now.strftime("%P")
			current_day = Time.now.strftime("%A").downcase

			account_sid = 'AC2ec0c952461062525f1c31d404bbb2e4'
			auth_token = 'cae29f856b7ad008c35deca310afe220'
			@client = Twilio::REST::Client.new account_sid, auth_token

			puts current_hour
			puts current_minute
			puts current_ampm

			@alarms = Alarm.all

			@alarms.each do |alarm| 

				if alarm.user.phone_number.blank?
					puts " #{alarm.user.first_name} #{alarm.user.last_name} doesn't have phone number"
				else
					if alarm.is_dismiss == "on"
						user_phone = alarm.user.phone_number

						up_hour	= alarm.wakeup_hour.to_f
						up_min = alarm.wakeup_minute.to_f
						up_ampm = alarm.wakeup_ampm.downcase


						puts "CURRENT TIME #{current_hour} #{current_minute} #{current_ampm}"
						puts "ALARM TIME #{alarm.wakeup_hour} #{alarm.wakeup_minute} #{alarm.wakeup_ampm}"
						correct_date = false
						if(current_day == "monday" && alarm.repeat_monday == "1")
						
							correct_date = true	
						
						elsif(current_day == "tuesday" && alarm.repeat_tuesday == "1")
						
							correct_date = true	
						
						elsif(current_day == "wednesday" && alarm.repeat_wednesday == "1")
						
							correct_date = true								
						
						elsif(current_day == "thursday" && alarm.repeat_thursday == "1")
						
							correct_date = true								
						
						elsif(current_day == "friday" && alarm.repeat_friday == "1")
						
							correct_date = true								
						
						elsif(current_day == "saturday" && alarm.repeat_saturday == "1")
						
							correct_date = true
						
						elsif(current_day == "sunday" && alarm.repeat_sunday == "1")
						
							correct_date = true
						
						else
						
							correct_date = false
						
						end



						if (( up_hour == current_hour) && (up_min == current_minute) && (up_ampm == current_ampm) && correct_date)
							
							url = "http://twimlets.com/message?Message%5B0%5D=This%20is%20a%20wake%20up%20call%20from%20zleep.%20The%20current%20time%20is%20#{alarm.wakeup_hour}%3A#{alarm.wakeup_minute}%20#{alarm.wakeup_ampm}.%20Please%20wake%20up%20you%20have%20a%20#{URI.escape(alarm.title)}%20coming%20up.%20Have%20a%20great%20day.&"
								puts "WAKEUP"

							if (alarm.wakeup_reminder_type == "sms")	
								puts "SMS WAKEUP"
								@client.account.messages.create(
								  :from => '+18587629676',
								  :to => user_phone,
								  :body => "This is a wakeup text from Zleep. The current time is #{alarm.wakeup_hour} #{alarm.wakeup_minute} #{wakeup_ampm} .Please wake up you have #{alarm.title} coming up soon. Thank you have a good day"
								)
							else
								puts "CALL WAKEUP"
								@client.account.calls.create(
								  :from => '+18587629676',
								  :to => user_phone,
								  :url => url
							 	)
							end
						end
						

						if (( alarm.sleeping_hour.to_f == current_hour) && (alarm.sleeping_minute.to_f == current_minute) && (alarm.sleeping_ampm.downcase == current_ampm) )
							reminder_url= "http://twimlets.com/message?Message%5B0%5D=Please%20go%20to%20sleep%20now.%20You%20have%20to%20wake%20up%20at%20#{alarm.wakeup_hour}%3A#{alarm.wakeup_minute}%20#{alarm.wakeup_ampm}%20for%20#{URI.escape(alarm.title)}.&"
								puts "REMINDER"

							if (alarm.sleep_reminder_type == "sms")
								puts "SMS REMDINDER"

								@client.account.messages.create(
								  :from => '+18587629676',
								  :to => user_phone,
								  :body => "Please go to sleep now. You have to wake up at #{alarm.wakeup_hour}:#{alarm.wakeup_minute} #{alarm.wakeup_ampm} for #{alarm.title}."
								)
							else
								puts "CALL REMDINDER"

								@client.account.calls.create(
								  :from => '+18587629676',
								  :to => user_phone,
								  :url => reminder_url
							 	)

							end

						end
					end
					

				end

				
			end

		end
	end
end
