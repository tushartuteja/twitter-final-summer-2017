class Like < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user

  after_create :send_like_mail

  def send_like_mail
  	### Enqueue
  	Resque.enqueue(SendLikeWorker,id)
  end

end
