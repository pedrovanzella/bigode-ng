class FollowingsController < ApplicationController
  
  before_filter :authenticate_user!

  def create
    following = current_user.followeds.build(:user_id => params[:follow])
    if following.save
      flash[:notice] = "Following"
      redirect_to root_url #TODO: Redirect back to user's profile
    else
      flash[:error] = "Unable to follow"
      redirect_to root_url
    end
  end

  def destroy
    following = current_user.followeds.find(params[:id])
    following.destroy
    flash[:notice] = "Unfollowed"
    redirect_to root_url
  end
end
