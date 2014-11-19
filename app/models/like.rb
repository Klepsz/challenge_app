class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer, counter_cache: true

  after_save :add_points_after_likeing

  protected

  def add_points_after_likeing
    answer.user.points += 5
    answer.user.save
  end
end
