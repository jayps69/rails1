class Ability
  include CanCan::Ability

  def initialize(user)
    # Default permissions (non-logged in users or users without roles)
    user ||= User.new  # guest user (not logged in)

    if user.has_role?(:superadmin)
      # Superadmins can manage everything, including users' roles
      can :manage, :all
      can :manage, User  # Allows superadmins to manage (edit) user roles
    elsif user.has_role?(:admin)
      # Admins can manage all articles
      can :manage, Article
    else
      # Regular users can only manage their own articles
      can :manage, Article, user_id: user.id
    end
  end
end
