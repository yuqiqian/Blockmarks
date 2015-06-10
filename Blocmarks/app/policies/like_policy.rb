class LikePolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    user.present? && user.liked(record)
  end
end