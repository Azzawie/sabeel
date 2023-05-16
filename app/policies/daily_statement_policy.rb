class DailyStatementPolicy < ApplicationPolicy
  def initialize(user, record)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user

    @user = user
    @record = record
  end

  def index?
    @user.can?('index', 'daily_statements')
  end

  def show?
    return true if create? || update?

    @user.can?('read', 'daily_statements')
  end

  def create?
    @user.can?('create', 'daily_statements')
  end

  def new?
    create?
  end

  def update?
    @user.can?('update', 'daily_statements')
  end

  def edit?
    update?
  end

  def destroy?
    @user.can?('destroy', 'daily_statements')
  end

  def delete?
    destroy?
  end
end
