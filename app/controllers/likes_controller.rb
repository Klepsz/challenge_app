class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    answer = Answer.find(params[:answer_id])

    if answer.user == current_user
      redirect_to :back, alert: "You are not allowed to single your answer out!"
    elsif
      answer.likes.find_by(user: current_user) != nil
      redirect_to :back, alert: "You have already liked this answer."
    else      
      @like = current_user.likes.build(answer: answer)
      @like.save
      redirect_to :back, notice: "You liked it"
    end
  end

end

