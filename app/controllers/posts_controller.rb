class PostsController < ApplicationController
    before_action :set_post, only: [:show]
    
    def index
      @posts = Post.all.to_a
      render json: @posts
    end
    
    def show
      render json: @post
    end
    
    def create
      if params[:post_id]
        # Create a comment
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
    
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      else
        # Create a post
        @post = Post.new(post_params)
    
        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end
    end
    
    private
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title, :content, :location)
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
          render json: { message: 'Post deleted successfully' }, status: :ok
        else
          render json: { error: 'Failed to delete post' }, status: :unprocessable_entity
        end
    end
  end