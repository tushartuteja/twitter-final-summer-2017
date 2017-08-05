class SendLikeWorker

	@queue = :send_like

	def self.perform like_id
		LikeMailer.send_like_mail(like_id).deliver_now
	end

end
