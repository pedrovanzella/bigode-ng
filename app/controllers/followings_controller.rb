class FollowingsController < ApplicationController
  
  before_filter :authenticate_user!

  def create
    following = current_user.followeds.build(:user_id => params[:follow])
    if following.save
      flash[:notice] = "Following"
      redirect_to :back
    else
      flash[:error] = "Unable to follow"
      redirect_to :back
    end
  end

  def destroy
    following = current_user.followeds.find(params[:id])
    following.destroy
    flash[:notice] = "Unfollowed"
    redirect_to :back
  end
end
