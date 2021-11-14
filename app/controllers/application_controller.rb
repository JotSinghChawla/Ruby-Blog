class ApplicationController < ActionController::Base
    
    before_action :configure_devise_parameters, if: :devise_controller?

    private
  
    def configure_devise_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:image_link, :username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :image_link])
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:username], except: [:email])         # No Need
    end
end
