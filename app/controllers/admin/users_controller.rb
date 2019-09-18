class Admin::UsersController < ApplicationController

  before_action :login_required, only: %i[edit]  

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.image_name = "default_user.png"

#    if params[:image]
#      @user.image_name = "#{@user.id}.jpg"
#      image = params[:image]
#      File.binwrite("public/user_images/#{@user.image_name}", image.read)
#    else
#      @user.image_name = "default_user.png"
#    end    

    if @user.save
      redirect_to posts_url, notice: "ユーザー登録が完了しました。"
    else
      render :new_admin_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_name, :admin)
  end

  def login_required
    redirect_to login_url, notice: "ログインをお願い致します。" unless current_user
  end

end

