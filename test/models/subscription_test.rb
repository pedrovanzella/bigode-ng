require "minitest_helper"

describe Subscription do

  before do
    @user = Factory(:user)
    @feed = Factory(:feed)
  end

  it "subscribes to existing feed" do
    @user.subscribe(@feed)
    @user.feeds.first.must_equal @feed
  end

  it "unsubscribes from feed" do
    @user.subscribe(@feed)
    @user.unsubscribe(@feed)
    @user.feeds.must_be_empty
    @feed.wont_be_nil
  end

  describe "subscribes to new feed" do

    before do
      @url = "http://new_url.com/feed.xml"
      @user.subscribe_url(@url)
    end

    it "creates a new feed" do
      @feed = Feed.find_by_feed_url(@url)
      @feed.wont_be_nil # Created feed
    end

    it "subscribes user to feed" do
      @feed = Feed.find_by_feed_url(@url)
      @user.feeds.must_include @feed
    end
  end

  describe "subscribes to url from existing feed" do

    before do
      @url = "http://new_url.com/feed.xml"
      @user.subscribe_url(@url)
      @user.subscribe_url(@url)
    end

    it "does not create a duplicate feed" do
      feeds = Feed.find_all_by_feed_url(@url)
      feeds.count.must_equal 1 # Must not create a duplicate
    end
  end
end
