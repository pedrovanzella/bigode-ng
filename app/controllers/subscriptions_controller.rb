class SubscriptionsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @feed = Feed.find_by_feed_url(params[:feed][:feed_url])
    if current_user.feeds.include? @feed
      flash[:warning] = "Already subscribed to this feed"
    elsif @feed
      # Feed already exists, just subscribe
      current_user.feeds << @feed
      current_user.save
    else
      # Feed does not exist, create it and subscribe
      @feed = Feed.new(params[:feed])
      if @feed.save
        current_user.feeds << @feed
        current_user.save
        flash[:notice] = "Subscribed!"
      else
        flash[:error] = "Could not save feed"
      end
    end
    redirect_to :back
  end

  def index
    @feeds = current_user.feeds
  end

  def show
    @feed = Feed.find(params[:id])
    @subscription = Subscription.find_by_user_id_and_feed_id(current_user, @feed)
    @subscription.sync
    @stories = @subscription.stories
  end

  def destroy
    @feed = Feed.find_by_feed_url(params[:feed_url])
    if @feed
      current_user.feeds.delete(@feed)
    else
      flash[:error] = "Could not unsubscribe, feed does not exist"
    end
  end
end
