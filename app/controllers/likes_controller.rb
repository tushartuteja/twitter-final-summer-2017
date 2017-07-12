class LikesController < ApplicationController
	before_action :authenticate_user!

	def toggle_like
		@tweet = Tweet.find(params[:tweet_id])
		like = Like.where(user: current_user, tweet: @tweet).first
		if like
			like.destroy!
			@is_liked = false	
		else
			Like.create(user: current_user, tweet: @tweet)
			@is_liked = true
		end

		respond_to do |format|
			format.js {}
		end
		
	end

end
