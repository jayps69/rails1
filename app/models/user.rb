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

  private

  def assign_default_role
    self.add_role(:member) if self.roles.blank?
  end

  def must_have_a_role
    errors.add(:roles, "Must have at least 1 role") if roles.blank?
  end
end
