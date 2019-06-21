class LikesController < ApplicationController
  before_action :require_user_logged_in 

  def create
    micropost = Micropost.find(params[:like_id])
    current_user.like(micropost)
    flash[:sucesse] ='投稿をお気に入りしました'
    redirect_to current_user
    
  end

  def destroy
    micropost = Micropost.find(params[:like_id])
    current_user.unlike(micropost)
    flash[:sucesse] ='投稿のお気に入りを解除しました'
    redirect_to current_user
    
  end
end
