class ExclusiveAreaPolicy < ApplicationPolicy
  def index? = user.role_admin?
  def create? = record.owner == user

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.role_admin?
        scope.all
      else
        scope.where(owner: user)
      end
    end
  end
end
