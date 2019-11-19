class PostsController < ApplicationController

  before_action :login_required, only: %i[create new]
  before_action :edit_login_required, only: %i[update edit]
  before_action :destroy_login_required, only: %i[destroy]
  
  def index
    @posts = Post.all.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(12).order('created_at DESC')
    @all_ranks = Post.find(Like.group(:comment_id).order('count(comment_id) DESC').pluck(:comment_id))
    @i = 1
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to posts_url, notice: "投稿を更新しました。"
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_url, notice: "あなたの体験を投稿しました。"
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_url, notice: "投稿を削除しました。"
  end


  private

  def post_params
    params.require(:post).permit(:content, :category)
  end

  def login_required
    redirect_to login_url, notice: "ログインをお願い致します。" unless current_user
  end

  def edit_login_required
    post = Post.find(params[:id])
    if current_user
      unless current_user.admin? || post.user_id == current_user.id
        redirect_to posts_url
      end
    end

    unless current_user
      redirect_to posts_url
    end
  end

  def destroy_login_required
    post = Post.find(params[:id])
    if current_user
      unless current_user.admin? || post.user_id == current_user.id
        redirect_to posts_url
      end
    end

    unless current_user
      redirect_to posts_url
    end
  end
end



