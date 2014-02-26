class TwilioController < ApplicationController
	def message
	        render 'message.xml.erb', :content_type => 'text/xml'

	end
	def validate

		    render 'validate.xml.erb', :content_type => 'text/xml'

	end
end
