class PostsController < ApplicationController
  def baseball
    @posts = Post.where(kind: "baseball")
  end

  def basketball
  end
  
  def show
    @post = Post.find(params[:id])
  end
end
