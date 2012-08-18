require "minitest_helper"

describe UserStory do
  before do
    @user_story = UserStory.create
  end

  it "can be liked" do
    @user_story.like
    @user_story.liked.must_equal true
  end

  it "can be unliked" do
    @user_story.unlike
    @user_story.liked.must_equal false
  end

  it "can be marked as read" do
    @user_story.mark_as_read
    @user_story.read.must_equal true
  end

  it "can be marked as unread" do
    @user_story.mark_as_unread
    @user_story.read.must_equal false
  end

  it "can be stared" do
    @user_story.star
    @user_story.stared.must_equal true
  end

  it "can be unstared" do
    @user_story.unstar
    @user_story.stared.must_equal false
  end
end
