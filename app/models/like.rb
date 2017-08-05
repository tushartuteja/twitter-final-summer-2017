class Like < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user

  after_create :send_like_mail

  def send_like_mail
  	 LikeMailer.send_like_mail(id).deliver_now
  end

end
