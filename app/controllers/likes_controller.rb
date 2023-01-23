class LikesController < ApplicationController
  before_action :set_post
  before_action :set_like, only: %i[destroy]
  def create
    @like = @post.likes.new(user_id: session[:user_id])
    if @like.save
      redirect_to @post
    else
      render :new
    end
  end

  def destroy
    @like.destroy
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_like
    @like = @post.likes.find(params[:id])
  end
end
