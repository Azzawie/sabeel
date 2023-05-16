class ChamberPolicy < ApplicationPolicy
  def initialize(user, record)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user

    @user = user
    @record = record
  end

  def index?
    @user.can?('index', 'chambers')
  end

  def show?
    return true if create? || update?

    @user.can?('read', 'chambers')
  end

  def create?
    @user.can?('create', 'chambers')
  end

  def new?
    create?
  end

  def update?
    @user.can?('update', 'chambers')
  end

  def edit?
    update?
  end

  def destroy?
    @user.can?('destroy', 'chambers')
  end

  def delete?
    destroy?
  end
end
