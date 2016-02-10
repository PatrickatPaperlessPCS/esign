class UserMailer < ApplicationMailer
  default :from => 'info@paperlesspcs.com'

	def sign_up(id)
	@user = User.find(id)	
		mail(
	  :subject => 'New Sign Up' ,
	  :to  => 'patrick@paperlesspcs.com' ,
	  :track_opens => 'true'
		)
	end
end
