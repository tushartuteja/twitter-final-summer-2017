class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: {member: 0, editor: 2, moderator: 1, admin: 3}     
  def feed

  	users = followee_ids
  	users << id
  	Tweet.includes(:user, :likes).where(user_id: users).order(created_at: :desc)
  end


  def follow_relation user_id
  	return UserRelations::SELF if id == user_id
  	if FollowMapping.where(:followee_id => user_id, :follower_id => id).length > 0
  		return UserRelations::FOLLOWED
  	else
  		return UserRelations::NOTFOLLOWED
  	end
  end

  def can_follow user_id
  	return follow_relation(user_id) == UserRelations::NOTFOLLOWED
  end

  def can_un_follow user_id
    return follow_relation(user_id) == UserRelations::FOLLOWED
  end

  def followee_ids
  	FollowMapping.where(follower_id: id).pluck(:followee_id)
  end

  # def role_str
  #   case role
  #   when 0
  #     return 'member'
  #   when 1
  #     return 'moderator'
  #   when 2
  #   when 3

  # end



  class UserRelations
  	SELF = 0
  	FOLLOWED = 1
  	NOTFOLLOWED = 2
  end


end
