class OrganizationsController < ApplicationController
  
  def edit
    @organization = Organization.find(current_user.organization_id)
  end

  def update
    @organization = Organization.find(current_user.organization_id)
    if @organization.update_attributes(org_params)
      flash[:success] = "Organization updated"
      redirect_to current_user
    else
      flash[:danger] = "Edit failed"
      render :edit
    end
  end

  private

  def org_params
    params.require(:organization)
          .permit(:name, contacts_attributes: [:id, :user_id, :contact_no, :created_at, :updated_at, :_destroy])
  end

end