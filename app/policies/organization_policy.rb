class OrganizationPolicy < ApplicationPolicy
  attr_reader :user, :organization

  def initialize(user, organization)
    @user = user
    @organization = organization
  end

  def update?
    user.admin?
  end
end