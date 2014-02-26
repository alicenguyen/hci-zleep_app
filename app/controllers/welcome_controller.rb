require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'


class WelcomeController < ApplicationController
	before_filter :authenticate_user!
	skip_before_filter  :verify_authenticity_token
	  def index
	    @alarms = current_user.alarms.all
	  end

    def demo 
 	  	@users = User.where("Users.phone_number IS NOT NULL")

    end

   def calling
   	type = params[:contact_type]
		user_id = params[:user_id]
	   	@message = params[:message]
		account_sid = 'AC2ec0c952461062525f1c31d404bbb2e4'
		auth_token = 'cae29f856b7ad008c35deca310afe220'
		@user = User.find(user_id)
		@client = Twilio::REST::Client.new account_sid, auth_token
   	if (type == 1)
	   	@client.account.messages.create(
		  :from => '+18587629676',
		  :to => @user.phone_number,
		  :body => @message
			)
   	else 
			@client.account.calls.create(
		  :from => '+18587629676',
		  :to => @user.phone_number,
		  :url => "https://dl.dropboxusercontent.com/u/84415358/message.xml"
		 	)
   	end
   

   end
	

end
