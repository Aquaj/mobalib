class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :handicap_id)
  end

  def account_update_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :handicap_id, :current_password)
  end
end
