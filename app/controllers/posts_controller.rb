class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:id])
    @user = User.find(params[:id])
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def new
    @user = current_user
  end

  def create
    @user = current_user
    @post = @user.authored_posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
