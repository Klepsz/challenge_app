class AnswerNotifier < ActionMailer::Base
  default from: "challenge_app@example.com"


  def new_asnwer(answer, questions_author)
    @answer = answer
    @questions_author = questions_author
    subject_content = "New answer to: '#{@answer.question.title}'"


    mail to: @questions_author.email, subject: subject_content
  end

  def accepted_answer
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
