class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    params.require(:user).permit(:email, :name, :plan, :subscribed, :company_name, :telephone, :password, :password_confirmation, :signature)
  end

    def account_update_params
    params.require(:user).permit(:email, :name, :plan, :subscribed, :company_name, :telephone, :password, :password_confirmation, :signature, :current_password)
  end



 # def after_sign_up_path_for(users)
#		client = Drip::Client.new(
#		  access_token: "cjzg7ptfoq2knmsiyzfw",
#		  account_id: "1032748",
#		  email: current_user.email
#		) 
 # end

end