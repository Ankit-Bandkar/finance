class Users::InvitationsController < Devise::InvitationsController
    before_action :configure_permitted_parameters, if: :devise_controller?
    def update
    #  current_user.orga
    end
  
private

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:accept_invitation, keys: [:email])
  devise_parameter_sanitizer.permit(:invite, keys: [:email, :organization_id])
end

end
