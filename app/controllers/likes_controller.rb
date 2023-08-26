class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(author: current_user)

    return unless @like.save

    redirect_to user_post_path(@post.author, @post)
  end
end
