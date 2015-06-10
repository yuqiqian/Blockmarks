class BookmarkPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def new
    create?
  end

  def destroy?
    user.present?
  end
end