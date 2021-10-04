class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  def new
    @tweet = Tweet.new
  end
  def create
    justnow = Time.current
    @tweet = Tweet.new(message: params[:tweet][:message],
                      tdate: justnow)
    if @tweet.save
      flash[:notice] = 'ツイートしました'
      redirect_to root_path
    else
      render new_tweet_path
    end
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end
  def show
    @tweet = Tweet.find(params[:id])
  end
  def edit 
    @tweet = Tweet.find(params[:id])
  end
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(message: params[:tweet][:message])
    redirect_to root_path
  end
end
