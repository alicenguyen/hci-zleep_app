module ApplicationHelper


def call_user(user_id, message) 
  	@user = User.find(user_id)
  	account_sid = 'AC2ec0c952461062525f1c31d404bbb2e4'
	auth_token = 'cae29f856b7ad008c35deca310afe220'

	@client = Twilio::REST::Client.new account_sid, auth_token

	@client.account.messages.create(
	  :from => '+18587629676',
	  :to => '+16105557069',
	  :body => message
	)
  end





end
