class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :likes

  validates :contents, presence: true

  before_save :check_answer_acceptance

  def check_answer_acceptance
    if self.question.answers.where(accepted_answer: true).size == 1 && self.accepted_answer == true
      errors.add(:answer, "You have accepted one answer already")
      self.accepted_answer = false
    end
  end
end
