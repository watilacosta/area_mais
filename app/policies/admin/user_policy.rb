class Admin::UserPolicy < ApplicationPolicy
  def index? = user.role_admin?

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
