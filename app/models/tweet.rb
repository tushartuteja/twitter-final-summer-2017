class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :content, presence: true, length: {maximum: 140}


  def liked_by user_id
    result = false
  	likes.each do |like|
      result = like.user_id == user_id
      if result
        break
      end
    end

    return result

  end


  def like_string user_id
  	if liked_by user_id
  		return "UnLike"
  	else
  		return "Like"
  	end

  end

  def can_modify user
    if User.roles[user.role] >= User.roles["editor"]
      return true
    else
      return user.id == user_id
    end

  end



end
