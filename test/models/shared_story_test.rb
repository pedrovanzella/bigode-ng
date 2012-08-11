require "minitest_helper"

describe SharedStory do
  before do
    @shared_story = SharedStory.new
  end

  it "must be valid" do
    @shared_story.valid?.must_equal true
  end
end
