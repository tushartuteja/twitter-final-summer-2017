require 'test_helper'

class LikeMailerTest < ActionMailer::TestCase
  test "send_like_mail" do
    mail = LikeMailer.send_like_mail
    assert_equal "Send like mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
