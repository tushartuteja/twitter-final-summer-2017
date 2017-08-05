# Preview all emails at http://localhost:3000/rails/mailers/like_mailer
class LikeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/like_mailer/send_like_mail
  def send_like_mail
    LikeMailer.send_like_mail Like.first.id
  end

end
