class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: %i[show edit update destroy]
  def index
    @comments = @post.comments.all
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to '/'
      raise 'test'
    else
      render :new
      message = 'Something went wrong. Please try again.'
      raise 'werk niet meer'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def new
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
