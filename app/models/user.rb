class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Assign a default role after user creation
  after_create :assign_default_role

  # Validate that the user has at least one role when updating
  validate :must_have_a_role, on: :update

  has_many :articles, dependent: :destroy


  # Check if the user has the admin role

  def superadmin?
    has_role?(:superadmin)
  end


  def admin?
    has_role?(:admin)
  end

  # Check if the user has the member role
  def member?
    has_role?(:member)
  end

  private

  # Assign default role (member) if no roles are assigned
  def assign_default_role
    self.add_role(:member) if self.roles.blank?
  end

  # Ensure user has at least one role
  def must_have_a_role
    errors.add(:roles, "must have at least one role") if roles.blank?
  end
end
