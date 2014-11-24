require 'test_helper'

class AnswerNotifierTest < ActionMailer::TestCase
  test "new_asnwer" do
    mail = AnswerNotifier.new_asnwer
    assert_equal "New asnwer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "accepted_answer" do
    mail = AnswerNotifier.accepted_answer
    assert_equal "Accepted answer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
