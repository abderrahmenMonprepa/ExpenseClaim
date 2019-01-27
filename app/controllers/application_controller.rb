class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
 
   protected

     def configure_permitted_parameters
         devise_parameter_sanitizer.permit(:sign_up) do |user_params| 
           user_params.permit(:first_name, :last_name , :date_of_birth , :phone_number ,
           :address  , :email, :password , :password_confirmation, :user_type)
         end
     end

end
