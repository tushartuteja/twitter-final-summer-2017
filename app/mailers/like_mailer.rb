class LikeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.like_mailer.send_like_mail.subject
  #
  def send_like_mail like_id
    @like = Like.find(like_id)

    mail to: @like.tweet.user.email, subject: "You tweet was liked"
  end
end
