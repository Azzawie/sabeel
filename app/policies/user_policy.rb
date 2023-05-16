
class UserPolicy < ApplicationPolicy
  def initialize(user, record)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user

    @user = user
    @record = record
  end

  def index?
    @user.can?('index', 'users')
  end

  def show?
    return true if create? || update?

    @user.can?('read', 'users')
  end

  def create?
    @user.can?('create', 'users')
  end

  def new?
    create?
  end

  def update?
    @user.can?('update', 'users')
  end

  def edit?
    update?
  end

  def destroy?
    @user.can?('destroy', 'users')
  end

  def delete?
    destroy?
  end
end
