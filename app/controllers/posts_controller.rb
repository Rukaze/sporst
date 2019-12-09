class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
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
      flash[:success] = "投稿しました"
    else
      @kind = @post.kind
      @sports = Sport.select(:kind).distinct
      @leagues = Sport.where(kind: @kind)
      render :new 
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    if @post.user_id != @current_user.id
      render :show
      flash[:danger] = 'ユーザーが違います'
    end
  end
  
  def update
    @post =  Post.find(params[:id])
    if @post.user_id != @current_user.id
      render :show
    else
      if @post.update(posts_params)
        redirect_to show_path(id: @post.id)
        flash[:success] = "編集しました"
      else
        render :edit 
      end
    end
  end
  
  def user_posts
    @sports = Sport.select(:kind).distinct
  end
  
  
  private
  
  def posts_params
    params.require(:post).permit(:kind,:content,:title,:league,:user_id)
  end
  
  
end
