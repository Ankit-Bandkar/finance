class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :organization_name
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invite_for => 2.weeks
  
  belongs_to :organization, optional: true

  validates_presence_of :organization_name

  before_create :create_organization_name, unless: :created_by_invite?

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
