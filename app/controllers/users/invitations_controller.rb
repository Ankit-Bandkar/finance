class Users::InvitationsController < Devise::InvitationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

  
private

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name])
  devise_parameter_sanitizer.permit(:invite, keys: [:email, :organization_id])
end

def authenticate_inviter!
  unless current_user.admin?
    redirect_to root_path, alert: "Access Denied"    
  end
  super
end

end
