class UserStoriesController < ApplicationController
  before_filter :authenticate_user!

  def like
    user_story = UserStory.find_by_story_id_and_user_id(params[:id], current_user.id)
    user_story.like if user_story
  end

  def unlike
    user_story = UserStory.find_by_story_id_and_user_id(params[:id], current_user.id)
    user_story.unlike if user_story
  end

  def mark_as_read
    user_story = UserStory.find_by_story_id_and_user_id(params[:id], current_user.id)
    user_story.mark_as_read if user_story
  end

  def mark_as_unread
    user_story = UserStory.find_by_story_id_and_user_id(params[:id], current_user.id)
    user_story.mark_as_unread if user_story
  end

  def star
    user_story = UserStory.find_by_story_id_and_user_id(params[:id], current_user.id)
    user_story.star if user_story
  end

  def unstar
    user_story = UserStory.find_by_story_id_and_user_id(params[:id], current_user.id)
    user_story.unstar if user_story
  end
end
