require "minitest_helper"

describe User do
  before do
    @user = Factory(:user)
  end

  describe "subscriptions" do
    before do
      @feed = Factory(:feed)
    end

    it "can subscribe" do
      @user.subscribe(@feed)
      @user.feeds.first.must_equal @feed
    end

    it "can unsubscribe" do
      @user.subscribe(@feed)
      @user.unsubscribe(@feed)
      @user.feeds.must_be_empty
      @feed.wont_be_nil
    end
  end
end
