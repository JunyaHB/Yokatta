class OauthController < ApplicationController
    def new
    end
  
    def create
      user = User.from_omniauth(request.env["omniauth.auth"])
  
      if user.save
        session[:user_id] = user.id
        redirect_to root_url, notice: "ログインしました。"
      else
        redirect_to "/auth/google_oauth2"
      end
    end
  end
  