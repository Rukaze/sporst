class PostsController < ApplicationController
  def baseball
    @posts = Post.where(kind: "baseball")
  end

  def basketball
    @posts = Post.where(kind: "basketball")
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(posts_params)
    @post.save
    redirect_to root_path
  end
  
  def posts_params
    params.require(:post).permit(:kind,:content,:title)
  end
end
