class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
 


  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to '/', notice: 'Tweet was successfully created.' }
        format.js {    }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render 'home/index' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id)
    end
end
