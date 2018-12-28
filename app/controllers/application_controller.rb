class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
       
    protected
   
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :organization_name, :avatar, contacts_attributes: [Contact.attribute_names.map(&:to_sym).push(:_destroy)]])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :organization_name, :avatar])
      devise_parameter_sanitizer.permit(:accept_invitation, keys: [:email, :organization_id])
    end
end
