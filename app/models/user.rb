class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :organization_name
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :organization, optional: true
  before_create :create_organization_name
  validates :organization_name, presence: true

  private

  def create_organization_name
    org = Organization.new(name: self.organization_name)
    if org.save
      self.organization_id = org.id
    else
      flash[:danger] = "Sign up failed" 
      redirect_to new_user_registration_path
    end
  end
end
