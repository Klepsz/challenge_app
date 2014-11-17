class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def check_questions_author
      redirect_to :back, alert: "You are not question's author!" if current_user != @question.user      
    end
end
