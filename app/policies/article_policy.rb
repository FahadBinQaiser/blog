class ArticlePolicy < ApplicationPolicy
  def update?
    user_is_author?
  end

  def destroy?
    user_is_author?
  end

  def edit?
    user_is_author?
  end

  private

  def user_is_author?
    user.present? && user == record.user
  end
end
