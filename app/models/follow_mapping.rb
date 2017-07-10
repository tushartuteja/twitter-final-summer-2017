class FollowMapping < ActiveRecord::Base
	validates_uniqueness_of :followee_id, scope: :follower_id
end
