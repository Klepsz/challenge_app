class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :likes

  validates :contents, presence: true

  before_update :check_answer_acceptance
  before_create :check_if_question_answered

  protected

  def check_answer_acceptance
    if question.answers.where(accepted_answer: true).size == 1 && accepted_answer == true
      errors.add(:base, "You have accepted one answer already")
      false
    end
  end

  def check_if_question_answered
    if question.answers.where(accepted_answer: true).size == 1
      errors.add(:base, "Question is already asnwered")
      false
    end
  end
end
