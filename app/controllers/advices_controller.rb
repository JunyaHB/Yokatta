class AdvicesController < ApplicationController

    before_action :login_required, only: %i[create destroy]
    

    def create
        post = Post.find(params[:post_id])
        @advice = post.advices.build(advice_params)
        @advice.user_id = current_user.id

        if @advice.save
          redirect_to request.referrer || post, notice: "コメントを投稿しました"
        else
          redirect_to request.referrer || post
          flash[:danger] = "コメントを投稿できませんでした"
        end
      end

      def destroy
        post = Post.find(params[:post_id])
        @post = post.advices.find(params[:id])
        @post.destroy
        redirect_to request.referrer || post
        flash[:danger] = "コメントを削除しました"
      end 
    
      private

      def advice_params
        params.require(:advice).permit(:content)
      end
   
     def login_required
       redirect_to login_url, notice: "ログインをお願い致します。" unless current_user
     end
  
    end    

