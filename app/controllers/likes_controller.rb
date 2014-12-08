class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @answer = Answer.find(params[:answer_id])

    respond_to do |format|
      if @answer.user == current_user
        @error = "You are not allowed to single your answer out!"
        format.html { redirect_to :back, alert: @error }
      elsif
        @answer.likes.find_by(user: current_user) != nil
        @error = "You have already liked this answer."
        format.html { redirect_to :back, alert: @error }
      else      
        @like = current_user.likes.build(answer: @answer)
        @like.save
        format.html { redirect_to :back }
      end
      format.js
    end
  end

end

