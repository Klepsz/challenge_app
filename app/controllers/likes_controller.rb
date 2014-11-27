class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    # answer = Answer.find(params[:answer_id])
    @answer = Answer.find(params[:answer_id])

    respond_to do |format|
      if @answer.user == current_user
        format.html { redirect_to :back, alert: "You are not allowed to single your answer out!" }
      elsif
        @answer.likes.find_by(user: current_user) != nil
        format.html { redirect_to :back, alert: "You have already liked this answer." }
      else      
        @like = current_user.likes.build(answer: @answer)
        @like.save
        format.html { redirect_to :back }
      end
      format.js
    end
  end

end

