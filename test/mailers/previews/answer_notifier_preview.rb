# Preview all emails at http://localhost:3000/rails/mailers/answer_notifier
class AnswerNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/answer_notifier/new_asnwer
  def new_asnwer
    AnswerNotifier.new_asnwer
  end

  # Preview this email at http://localhost:3000/rails/mailers/answer_notifier/accepted_answer
  def accepted_answer
    AnswerNotifier.accepted_answer
  end

end
