class RelationshipsController < ApplicationController
    before_action :login_required
  
    def create
      user = User.find(params[:followed_id])
      current_user.follow(user)
      redirect_to request.referrer || user
    end
  
    def destroy
      user = Relationship.find(params[:id]).followed
      current_user.unfollow(user)
      redirect_to request.referrer || user
    end
  end

  private  
  def login_required
    redirect_to login_url, notice: "ログインをお願い致します。" unless current_user
  end
