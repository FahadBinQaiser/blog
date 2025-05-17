class CommentsController < ApplicationController
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.build(comment_params)
    @comment.article = @article
    if @comment.save
      redirect_to article_path(@article)
    else
      render "articles/show", status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    authorize @comment
    @comment.destroy

    redirect_to article_path(@article), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

  def user_not_authorized
    flash[:alert] = "You're not authorized to perform this action. You don't own this comment."
    redirect_to(request.referrer || root_path)
  end
end
