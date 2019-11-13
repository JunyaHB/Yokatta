class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])

    if @user&.authenticate(session_params[:password])
       session[:user_id] = @user.id
       redirect_to "/users/#{current_user.id}", notice: "ログインしました。"
    else
      flash.now[:danger] = "ログインに失敗しました。正しいメールアドレスとパスワードをご入力ください。"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "ログアウトしました。"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def login_required
    redirect_to login_url unless current_user
  end

end
