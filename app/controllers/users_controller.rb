class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    else
      @user.image_name = "default_user.png"
    end    

    if @user.save
      redirect_to posts_url, notice: "ユーザー登録が完了しました。"
    else
      render :new
    end
  end

  def edit
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_name)
  end
end
