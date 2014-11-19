class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :title, presence: true

  after_save :subtract_points_after_creating_question

  protected

  def subtract_points_after_creating_question
    user.points -= 10
    user.save
  end
end
