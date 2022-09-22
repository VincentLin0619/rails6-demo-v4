require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "hello_user" do
    mail = UserMailer.hello_user
    assert_equal "Hello user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
