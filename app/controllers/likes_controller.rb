class LikesController < ApplicationController

  

  def create
    @like = Like.new(
    user_id: current_user.id,
    comment_id: params[:post_id])
    @like.save
    redirect_to posts_url
  end

  def destroy
    
    @like = Like.find_by(user_id: current_user.id, comment_id: params[:post_id])
    @like.destroy
    redirect_to posts_url
  end


  private

  def like_params
    params.require(:like).permit(:user_id, :comment_id)
  end

end