class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user, counter_cache: true
  has_many :likes

  validates :contents, presence: true

  before_update :check_answer_acceptance
  before_create :check_if_question_answered
  after_save :add_points_after_acceptation_and_question_is_answered

  protected

  def check_answer_acceptance
    if question.answered? && accepted_answer == true
      errors.add(:base, "You have accepted one answer already")
      false
    end
  end

  def check_if_question_answered
    if question.answered?
      errors.add(:base, "Question is already asnwered")
      false
    end
  end

  def add_points_after_acceptation_and_question_is_answered
    if accepted_answer == true
      user.points += 25
      user.save
      question.answered = true
      question.save
    end
  end
end
