module ApplicationHelper
  def is_admin?
    if current_user
      current_user.admin?
    else
      false
    end
  end  
end
