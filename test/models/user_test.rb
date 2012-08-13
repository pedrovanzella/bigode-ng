require "minitest_helper"

describe User do
  before do
    @user = Factory(:user)
  end

  describe "subscribing to feeds" do
    before do
      @feed = Factory(:feed)
    end

    it "can subscribe" do
      @user.subscribe(@feed)
      @user.feeds.first.must_equal @feed
    end

  end
end
