class CommentPolicy < ApplicationPolicy
  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    user.present? && user == record.user
  end
end
