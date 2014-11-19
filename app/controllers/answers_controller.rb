class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question
  before_action :set_answer, only: [:edit, :update]
  before_action :check_questions_author, only: [:edit, :update]

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@question), notice: "Answer was successfully created."
    else
      redirect_to question_path(@question), alert: "There was an error when adding answer."
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params) && @answer.accepted_answer == true
      redirect_to question_path(@question), notice: "Answer has been accepted"
    elsif @answer.update(answer_params) && @answer.accepted_answer == false
      redirect_to question_path(@question), alert: "Answer has been rejected"
    else
      redirect_to edit_question_answer_path(@question, @answer)
    end
  end

  private

    def set_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = @question.answers.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:contents, :accepted_answer)
    end
end
