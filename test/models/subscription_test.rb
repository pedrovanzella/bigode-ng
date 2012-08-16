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

  it "subscribes to new feed" do
    url = "http://new_url.com/feed.xml"
    @user.subscribe_url(url)
    feed = Feed.find_by_feed_url(url)
    feed.wont_be_nil # Created feed
    @user.feeds.must_include feed
  end
end
