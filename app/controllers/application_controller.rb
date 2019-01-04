class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
       
    protected
   
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :organization_name, :avatar, contacts_attributes: [:id, :user_id, :contact_no, :created_at, :updated_at, :_destroy]])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :organization_name, :avatar, contacts_attributes: [:id, :user_id, :contact_no, :created_at, :updated_at, :_destroy]])
      devise_parameter_sanitizer.permit(:accept_invitation, keys: [:email, :organization_id])
    end
end
