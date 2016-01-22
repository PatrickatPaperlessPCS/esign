class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    params.require(:user).permit(:email, :plan, :subscribed, :company_name, :telephone, :password, :password_confirmation, :signature)
  end
  def baa
  end
end