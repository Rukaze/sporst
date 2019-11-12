class PostsController < ApplicationController
  def baseball
    @posts = Post.where(kind: "baseball")
  end

  def basketball
  end
end
