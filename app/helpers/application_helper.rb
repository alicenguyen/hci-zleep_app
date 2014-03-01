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

def google_analytics_js
  '<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-48535160-1', 'zleepapp.herokuapp.com');
  ga('send', 'pageview');

</script>'
end




end
