class Question < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  has_many :answers, dependent: :destroy

  validates :title, presence: true

  after_save :subtract_points_after_creating_question

  protected

  def subtract_points_after_creating_question
    user.points -= 10
    user.save
  end
end
