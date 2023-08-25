class UsersController < ApplicationController
  def index
    @users = User.all # Fetch all users from the database
  end

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
