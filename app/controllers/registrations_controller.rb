class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    params.require(:user).permit(:email, :name, :plan, :subscribed, :company_name, :telephone, :password, :password_confirmation, :signature)
  end

    def account_update_params
    params.require(:user).permit(:email, :name, :plan, :subscribed, :company_name, :telephone, :password, :password_confirmation, :signature, :current_password)
  end

end