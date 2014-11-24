class AnswerNotifier < ActionMailer::Base
  default from: "challenge_app@example.com"


  def new_answer(answer, questions_author)
    @answer = answer
    @questions_author = questions_author
    subject_content = "New answer to: '#{@answer.question.title}'"

    mail to: @questions_author.email, subject: subject_content
  end

  def accepted_answer(answer)
    @answer = answer
    mail to: @answer.user.email, subject: "Congratulations. Your answer has been accepted"
  end
end
