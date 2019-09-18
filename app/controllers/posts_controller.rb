class PostsController < ApplicationController

  before_action :login_required, only: %i[new]

  def index
    @posts = Post.all
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


  private

  def post_params
    params.require(:post).permit(:content, :category)
  end

  def login_required
    redirect_to login_url, notice: "新規投稿の前にログインをお願い致します。" unless current_user
  end

end
