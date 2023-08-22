class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def posts
    @user = User.find(params[:user_id])
  end

  def post
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end
end
