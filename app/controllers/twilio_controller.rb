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
			current_hour = Time.now.strftime("%I")
			current_minute = Time.now.strftime("%M")
			current_ampm = Time.now.strftime("%P")
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
					user_phone = alarm.user.phone_number
					if (( alarm.wakeup_hour == current_hour) && (alarm.wakeup_minute == current_minutee) && (alarm.wakeup_ampm.downcase == current_ampm) )

					url = "http://twimlets.com/message?Message%5B0%5D=This%20is%20a%20wake%20up%20call%20from%20Zleep.%20You%20have%20a%20#{URI.escape(alarm.title)}%20at%20#{alarm.wakeup_hour}%3A#{alarm.wakeup_minute}%20#{alarm.wakeup_ampm}.%20Please%20wake%20up%20and%20have%20a%20great%20day.&"
					puts url
					@client.account.calls.create(
					  :from => '+18587629676',
					  :to => user_phone,
					  :url => url
				 	)

					end


					if (( alarm.sleeping_hour == current_hour) && (alarm.sleeping_minute == current_minute) && (alarm.sleeping_ampm.downcase == current_ampm) )
						@client.account.messages.create(
						  :from => '+18587629676',
						  :to => user_phone,
						  :body => "Please go to sleep. You have to wake up tomorrow"
						)
					end
				end

				
			end

		end
	end
end
