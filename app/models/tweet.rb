class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :content, presence: true, length: {maximum: 140}


  def liked_by user_id
  	Like.where(tweet_id: id, user_id: user_id).length > 0
  end


  def like_string user_id
  	if liked_by user_id
  		return "UnLike"
  	else
  		return "Like"
  	end

  end


end
