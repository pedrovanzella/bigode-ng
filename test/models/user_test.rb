require "minitest_helper"

describe User do
  before do
    @user = Factory(:user)
  end

  it "can log in" do
    sign_in @user
  end

  describe "subscribing to feeds" do
    before do
      @feed = Feed.new
    end
  end
end
