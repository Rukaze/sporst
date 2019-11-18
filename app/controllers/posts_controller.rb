class PostsController < ApplicationController
  def league
    @post_kind = params[:kind]
    @leagues = Sport.where(kind: @post_kind)
    

  end
  
  def index
    @posts = Post.where(league: params[:league])
    @post_league = params[:league]
  end

 
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
    @kind = params[:kind]
    @leagues = Sport.where(kind: @kind)
    @sports = Sport.select(:kind).distinct
  end
  
  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to index_path(league: @post.league)
    else
      @kind = @post.kind
      @sports = Sport.select(:kind).distinct
      @leagues = Sport.where(kind: @kind)
      render :new 
    end
  end
  
  
  
  def posts_params
    params.require(:post).permit(:kind,:content,:title,:league)
    
  end
end
