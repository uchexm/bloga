class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.author = current_user
    @like.post = @post
    @like.save
    redirect_to user_posts_path(@user.id)
  end
end
