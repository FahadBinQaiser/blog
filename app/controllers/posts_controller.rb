class PostsController < ApplicationController
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post

    @post.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def post_params
    params.require(:post).permit(:title, :image)
  end
  
  def user_not_authorized
    flash[:alert] = "You're not authorized to perform this action. You don't own this post."
    redirect_to(request.referrer || root_path)
  end
end
