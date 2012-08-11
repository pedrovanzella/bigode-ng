class SharedStoriesController < ApplicationController

  def create
    @shared_story = SharedStory.create(params)
    if @shared_story
      flash[:notice] = "Shared"
    else
      flash[:error] = "Could not share"
    end

    redirect_to :back
  end

  def destroy
    @shared_story = SharedStory.find_by_user_id_and_story_id(params[:user_id], params[:story_id])
    if @shared_story
      @shared_story.destroy
      flash[:notice] = "Unshared"
    else
      flash[:error] = "Could not unshare (maybe this story wasn't shared?)"
    end
    redirect_to :back
  end

  def index
    @shared_stories = SharedStory.order("created_at DESC").find_all_by_username(params[:username])
  end
end
