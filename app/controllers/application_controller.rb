class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    user_data = [
      :role,
      :language,
      :city_quarter,
      :city_quarter_id,
      :cw_nickname
    ]
    devise_parameter_sanitizer.permit(:sign_up, keys: user_data)
    devise_parameter_sanitizer.permit(:account_update, keys: user_data)
  end

  def current_city_quarter
    current_user.city_quarter
  end

end
