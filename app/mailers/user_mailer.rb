class UserMailer < ApplicationMailer
  default :from => 'info@paperlesspcs.com'

	def sign_up(id)
	@user = User.find(id)	
		mail(
	  :subject => 'New Sign Up' ,
	  :to  => 'patrick@esignhealth.com' ,
	  :track_opens => 'true'
		)
	end

	def new_sign_up(id)
	@user = User.find(id)	
		mail(
	  :subject => 'Welcome to eSign Health!' ,
	  :to  => @user.email ,
	  :track_opens => 'true'
		)
	end

	def creation_email(id)
	@user = User.find(id)	
		mail(
	  :subject => "You've made a template!" , #TODO Adjust subject
	  :to  => @user.email ,
	  :track_opens => 'true'
		)
	end

	def update_email(id)
	@user = User.find(id)	
		mail(
	  :subject => 'Your template is ready to send!' , #TODO Adjust subject
	  :to  => @user.email ,
	  :track_opens => 'true'
		)
	end

	def deleted(id)
	@user = User.find(id)	
		mail(
	  :subject => 'CANCELLATION' ,
	  :to  => 'patrick@esignhealth.com' ,
	  :track_opens => 'true'
		)
	end

	def account_deleted(id)
	@user = User.find(id)	
		mail(
	  :subject => "We're sorry to see you go!" ,
	  :to  => @user.email ,
	  :track_opens => 'true',
		)
	end

end


