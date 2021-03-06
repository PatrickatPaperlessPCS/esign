class DocumentMailer < ApplicationMailer
  default :from => 'support@esignhealth.com'


	def email(document)
		@document = document
	     mail(
	  :subject => 'Please Review and Sign' ,
	  :to  => @document.recipient ,
	  :track_opens => 'true'
	)
	end


	def update(document)
		@document = document
	     mail(
	  :subject => "Your document has been completed" ,
	  :to  => @document.user.email ,
	  :track_opens => 'true',
	)

	end
	# TODO: Later - decided reminder wasn't a critical funtion.  Saved for later date.
	#def reminder(document)
	#	@document = document
	#     mail(
	#  :subject => "REMINDER: Please Review and Sign" ,
	#  :to  => @document.recipient ,
	#  :track_opens => 'true',
	#)

	#end
end