class AnswerNotifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.answer_notifier.new_asnwer.subject
  #
  def new_asnwer
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.answer_notifier.accepted_answer.subject
  #
  def accepted_answer
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
