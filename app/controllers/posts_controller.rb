class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
    end

    def create
        @post = Post.new(post_params)
        if @post.save
          # Handle successful creation
        else
          # Handle validation errors
        end
      end
      
      private
      
      def post_params
        params.require(:post).permit(:title, :content, :location)
      end

      def index
        @post = Post.find(params[:id])
        @comments = @post.comments
        render json: @post
      end
end
