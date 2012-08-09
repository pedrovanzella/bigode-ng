class SubscriptionsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @feed = Feed.find_by_feed_url(params[:feed][:feed_url])
    if current_user.feeds.include? @feed
      flash[:warning] = "Already subscribed to this feed"
      redirect_to :back
    end
    if @feed
      # Feed already exists, just subscribe
      current_user.feed << @feed
      redirect_to :back
    else
      # Feed does not exist, create it and subscribe
      @feed = Feed.new(params[:feed])
      if @feed.save
        current_user.feeds << @feed
        flash[:notice] = "Subscribed!"
        redirect_to :back
      else
        flash[:error] = "Could not save feed"
        redirect_to :back
      end
    end
  end

  def index
    @feeds = current_user.feeds
  end

  def show
    @feed = Feed.find(params[:id])
    # TODO: Filter and only show stories that are unread?
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
