class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :organization_name
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invite_for => 2.weeks
  
  has_many :contacts, as: :contactable, dependent: :destroy
  accepts_nested_attributes_for :contacts, allow_destroy: true, reject_if: proc { |att| att['contact_no'].blank? }

  belongs_to :organization, optional: true
  has_many :entry, class_name: 'Entry'
  has_many :income, class_name: 'Income'
  has_many :expense, class_name: 'Expense'
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_size :avatar, :less_than => 5.megabytes

  validates_presence_of :organization_name, on: :create

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
