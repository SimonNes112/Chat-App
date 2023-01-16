class CommentsController < ApplicationController

    def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments.all
    end
    def create 
        @post = Post.find(params[:comment][:id])
        @comments = @post.comments.create(params[:comment])
        if @comments.save
            redirect_to @post
        else
            redirect_to post_path
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    def edit
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end

    def update
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        if @comment.update(comment_params)
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    def new 
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :user_id)
    end
end