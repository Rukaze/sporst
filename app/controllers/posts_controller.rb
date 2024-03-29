class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  include PostsHelper
  
  def league
    @post_kind = params[:kind]
    
    @leagues = Sport.where(kind: @post_kind)
   

  end
  
  def index
    @posts = Post.where(league: params[:league])
    @post_league = params[:league]
    if user_signed_in? and @post_league != current_user.s_history and @post_league != current_user.f_history and @post_league != current_user.t_history 
      if current_user.s_history.present?
        current_user.t_history = current_user.s_history
      save_history()
        
      end
      if current_user.f_history.present?
        current_user.s_history = current_user.f_history
      save_history()
      end
      current_user.f_history = @post_league
      save_history()
    end
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
